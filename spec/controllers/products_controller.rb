require 'spec_helper'

describe ProductsController do
	describe "GET #index" do
		it "iterates all then products into an array" do
			product = FactoryGirl.build(:product)
			get :index
			assigns(:products).should eq([product])
		end

		it "renders the index view if user signed in" do
			current_user = FactoryGirl.build(:user)
			get :index
			response.should render_template :index
		end
	end

	describe "GET #show" do
		it "should redirect to root if the user is not signed in" do
			current_user = nil
			response.should redirect_to(root_url)
		end
		it "it funnels the right product to the @product variable" do
			product = FactoryGirl.build(:product)
			get :show, id: product
			assigns(:product).should eq(product)
		end

		it "renders the :show template if user signed in" do
			current_user = FactoryGirl.build(:user) 
			get :show, id: FactoryGirl.build(:product)
			response.should render_template :show
		end
	end

	describe "GET #new" do
		it "should redirect to root if the user is not admin" do
			user = FactoryGirl.build(:user, admin: false)
			response.should redirect_to(root_url)
		end
		it "renders the :new template if user is admin" do
			user = FactoryGirl.build(user, admin: true)
			get :new, id: FactoryGirl.build(:product)
			response.should render_template :new
		end
	end

	describe "POST #create" do

		context "with attributes within parameters" do
			it "saves the product in the database" do
				expect{
					post :create, product: FactoryGirl.build.attributes_for(:product)
				}.to change(Product,:count).by(1)
			end
			it "redirect to the Product index template" do
				post :create, product: FactoryGirl.build.attributes_for(:product)
				response.should redirect_to Product.last
			end
		end

		context "with invalid attributes" do
			it "does not save the new product to the database" do
				expect{
					post :create, product: FactoryGirl.build.attributes_for(:invalid_product)
				}.to_not change(Product, :product)
			end
			it "re-renders the :new template" do
				post :create, product: FactoryGirl.build.attributes_for(:invalid_product)
				response.should render_template :new
			end
		end
	end

	describe "PUT update" do
		before :each do
			@product = FactoryGirl.build(:product, name: "Masterpiece", creator: "Kight Kolas")
		end

		context "valid attributes" do
			it "located the requested @product" do
				put :update, id: @product, product: FactoryGirl.build.attributes_for(:product)
				assigns(:product).should eq(@product)
			end

			it "changes @product's attributes" do
				put :update, id: @product,
					product: FactoryGirl.build.attributes_for(:product, name: "Masterpiece", creator: "Knight Kolas")
				end
			end

			it "redirect to the updated product" do
				put :update, id: @product, product: FactoryGirl.build.attributes_for(:product)
				response.should redirect_to @product
			end

		end

		context "invalid attributes" do

			it "located the appropiarte @product" do
				put :update, id: @product, product: FactoryGirl.build.attributes_for(:invalid_product)
				assigns(:product).should eq(@product)
			end

			it "does not change @product's attributes" do

				put :update, id: @product,
					product: FactoryGirl.build.attributes_for(:product, name: "Masterpiece", creator: nil)
				@product.reload
				@product.name.should_not eq("Masterpiece")
				@product.creator.should_not eq("Kight Kolas")
			end

			it "re-renders the edit method" do
				put :update, id: @product, product: FactoryGirl.build.attributes_for(:invalid_product)
				response.should render_template :edit
			end

		end		

	end

	describe 'Delete destroy' do

		before :each do
			@product = FactoryGirl.build(:product)
		end

		it "deletes the products" do
			expect{
				delete :destroy, id: @product
			}.to change(Product, :count).by(-1)
		end

		it "redirects to products#index" do
			delete :destroy, id: @product
			response.should redirect_to(products_ulr)
		end
	end

end