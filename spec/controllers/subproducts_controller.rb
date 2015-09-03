require 'spec_helper'
require 'rails_helper'

describe SubproductsController do

	describe "POST #create" do
		before(:each) do
			sign_in create(:user)
			@product = create(:product)

		end


		context "with attributes within parameters" do
			it "saves the subproduct in the database" do
				expect{
					post :create, product_id: @product.id, subproduct: attributes_for(:subproduct, product_id: @product.id)
				}.to change(Subproduct, :count).by(1)
			end
		end

		context "with invalid attributes" do
			it "does not save the new subproduct to the database" do
				expect{
					post :create, product_id: @product.id, subproduct: attributes_for(:subproduct, size: nil, product_id: @product.id)
				}.to_not change(Subproduct, :count)
			end
		end
	end


	describe "PUT #update" do
		before :each do
			sign_in create(:user)
			@product = create(:product)
			@subproduct = create(:subproduct, product_id: @product.id)
			
		end


		context "valid attributes" do
			it "located the requested @subproduct" do
				put :update, product_id: @product.id, id: @subproduct.id, subproduct: attributes_for(:subproduct, product_id: @product.id)
				assigns(:subproduct).should eq(@subproduct)
			end

			it "changes @subproduct's attributes" do
				put :update, product_id: @product.id, id: @subproduct.id,
					subproduct: attributes_for(:subproduct, product_id: @product.id, size: "medium", price: 19.99)
				@subproduct.reload
				@subproduct.size.should eq("medium")
				@subproduct.price.should eq(19.99)

			end

		end

		context "invalid attributes" do

			it "located the appropiarte @subproduct" do
				put :update, product_id: @product.id, id: @subproduct.id, subproduct: attributes_for(:subproduct, product_id: @product.id, size: "medium", price: nil)
				assigns(:subproduct).should eq(@subproduct)
			end

			it "does not change @subproduct's attributes" do

				put :update, product_id: @product.id, id: @subproduct.id, subproduct: attributes_for(:subproduct, product_id: @product.id, size: "medium", price: nil)
				@subproduct.reload
				@subproduct.size.should_not eq("medium")
				@subproduct.price.should_not eq("14.99")
			end

		end		

	end

	describe 'Delete #destroy' do
		before :each do
			sign_in create(:user)
			@product = create(:product)
			@subproduct = create(:subproduct, product_id: @product.id)
			
		end
		context "valid delete" do
			it "deletes the subproducts" do
				expect{
					delete :destroy, product_id: @product.id, id: @subproduct.id
				}.to change(Subproduct, :count).by(-1)
			end
		end

	end

end