require 'spec_helper'
require 'rails_helper'
require 'database_cleaner'

describe ProductsController do
	describe "GET #index" do
		it "iterates all then products into an array" do
			get :index
			assigns(:products).should eq(Product.all)
		end

		it "renders the index view" do
			get :index
			response.should render_template :index
		end
	end

	describe "GET #show" do
		it "funnels the right product to the @product variable" do
			sign_in create(:user)
			product = create(:product)
			get :show, id: product.id
			assigns(:product).should eq(product)
		end

		it "renders the :show template" do
			sign_in create(:user)
			product = create(:product)
			get :show, id: product.id
			response.should render_template :show
		end
		it "should redirect to root if the user is not signed in" do
			product = create(:product)
			get :show, id: product.id
			response.should redirect_to(new_user_session_path)
		end
	end

	describe "GET #new" do
		it "renders the :new template if user is signed in and admin" do
			sign_in create(:admin)
			get :new
			response.should render_template :new
		end
		it "should redirect to sign in if the user is not signed in" do
			get :new
			response.should redirect_to(new_user_session_path)
		end
		it "should redirect to root if user is signed in but not admin" do
			sign_in create(:user)
			get :new
			response.should redirect_to(root_path)
		end
	end

	describe "POST #create" do

		context "with attributes within parameters" do
			it "saves the product in the database" do
				sign_in create(:admin)
				expect{
					post :create, product: attributes_for(:product)
				}.to change(Product,:count).by(1)
			end
			it "redirect to the product index template" do
				sign_in create(:admin)
				post :create, product: attributes_for(:product)
				response.should redirect_to(product_path(Product.last))
			end

		end

		context "with invalid attributes" do
			it "does not save the new product to the database" do
				sign_in create(:admin)
				expect{
					post :create, product: attributes_for(:product, name: nil)
				}.to_not change(Product, :count)
			end
			it "re-renders the :new template" do
				sign_in create(:admin)
				post :create, product: attributes_for(:product, name: nil)
				response.should render_template :new
			end
		end
	end

	describe "PUT #update" do
		before :each do
			sign_in create(:admin)
			@product = create(:product, name: "Something Random", description: "Something Descriptive")
		end

		context "valid attributes" do

			

			it "located the requested @product" do
				put :update, id: @product.id, product: attributes_for(:product)
				assigns(:product).should eq(@product)
			end

			it "changes @product's attributes" do
				put :update, id: @product.id,
					product: attributes_for(:product, name: "Masterpiece", description: "Wonderful.")
				@product.reload
				@product.name.should eq("Masterpiece")
				@product.description.should eq("Wonderful.")
			end

			it "redirect to the updated product" do
				put :update, id: @product.id, product: attributes_for(:product)
				response.should redirect_to product_path(@product)
			end

		end

		context "invalid attributes" do

			it "located the requested @product" do
				put :update, id: @product.id, product: attributes_for(:product)
				assigns(:product).should eq(@product)
			end

			it "does not change @product's attributes" do

				put :update, id: @product.id,
					product: attributes_for(:product, name: "Masterpiece", description: nil)
				@product.reload
				@product.name.should_not eq("Masterpiece")
				@product.description.should eq("Something Descriptive")
			end
		end		
	end

	describe 'Delete destroy' do

		before :each do
			sign_in create(:admin)
			@product = create(:product)
		end


		it "deletes the products" do
			expect{
				delete :destroy, id: @product.id
			}.to change(Product, :count).by(-1)
		end

		it "redirects to products#index" do

			delete :destroy, id: @product.id
			response.should redirect_to(products_path)
		end
	end

end