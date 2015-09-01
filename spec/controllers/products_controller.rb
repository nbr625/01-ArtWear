require 'spec_helper'
require 'rails_helper'
require 'database_cleaner'

describe ProductsController do
	describe "GET #index" do
		it "iterates all then products into an array" do
			get :index
			assigns(:products).should eq(Product.all)
		end

		it "renders the index view if user signed in" do
			get :index
			response.should render_template :index
		end
	end

	describe "GET #show" do

		it "it funnels the right product to the @product variable" do
			product = create(:product)
			get :show, id: product.id
			assigns(:product).should eq(product)
		end

		it "renders the :show template if user signed in" do

    		user = create(:user)
    		sign_in user
			product = create(:product, id: 24)
			get :show, id: product.id
			response.should render_template(:show)

		end
	end

	describe "GET #new" do
		it "should redirect to root if the user is not admin" do
			current_user = build(:user)
			response.should redirect_to(root_url)
		end
		it "renders the :new template if user is admin" do
			current_user = build(:admin)
			get :new, id: build(:product)
			response.should render_template :new
		end
	end

	describe "POST #create" do

		context "with attributes within parameters" do
			it "saves the product in the database" do
				expect{
					post :create, product: attributes_for(:product)
				}.to change{Product.count}.by(1)
			end
			it "redirect to the Product index template" do
				post :create, product: attributes_for(:product)
				expect(response).to redirect_to Product.last
			end
		end

		context "with invalid attributes" do
			it "does not save the new product to the database" do
				expect{
					post :create, product: attributes_for(:product, name: nil)
				}.not_to change{Product.count}.by(1)
			end
			it "re-renders the :new template" do
				post :create, product: attributes_for(:product, name: nil)
				expect(response).to redirect_to :new
			end
		end
	end

	describe "PUT update" do
		before :each do
			@product = FactoryGirl.build(:product, name: "Masterpiece", creator: "Kight Kolas")
		end

		context "valid attributes" do
			it "located the requested @product" do
				put :update, id: @product, product: build.attributes_for(:product)
				assigns(:product).should eq(@product)
			end

			it "changes @product's attributes" do
				put :update, id: @product,
					product: FactoryGirl.build.attributes_for(:product, name: "Masterpiece", creator: "Knight Kolas")
			end

			it "redirect to the updated product" do
				put :update, id: @product, product: build.attributes_for(:product)
				response.should redirect_to @product
			end

		end

		context "invalid attributes" do

			it "located the appropiarte @product" do
				put :update, id: @product, product: build.attributes_for(:invalid_product)
				assigns(:product).should eq(@product)
			end

			it "does not change @product's attributes" do

				put :update, id: @product,
					product: build.attributes_for(:product, name: "Masterpiece", creator: nil)
				@product.reload
				@product.name.should_not eq("Masterpiece")
				@product.creator.should_not eq("Kight Kolas")
			end

			it "re-renders the edit method" do
				put :update, id: @product, product: build.attributes_for(:invalid_product)
				response.should render_template :edit
			end

		end		

	end

	describe 'Delete destroy' do

		before :each do
			@product = Fbuild(:product)
		end

		it "deletes the products" do
			expect{
				delete :destroy, id: @product.id
			}.to change(Product, :count).by(-1)
		end

		it "redirects to products#index" do
			delete :destroy, id: @product.id
			response.should redirect_to(products_ulr)
		end
	end

end