require 'spec_helper'
require 'rails_helper'

describe SubproductsController, type: :c do
	describe "POST #create" do

		context "with attributes within parameters" do
			it "saves the subproduct in the database" do
				expect{
					post :create, subproduct: FactoryGirl.build.attributes_for(:subproduct)
				}.to change(Subproduct).length.by(1)
			end
		end

		context "with invalid attributes" do
			it "does not save the new subproduct to the database" do
				expect{
					post :create, subproduct: FactoryGirl.build.attributes_for(:invalid_subproduct)
				}.to_not change(Subproduct, :subproduct)
			end
			it "re-renders the :new template" do
				post :create, subproduct: FactoryGirl.build.attributes_for(:invalid_subproduct)
				response.should render_template :new
			end
		end
	end


	describe "PUT #update" do
		before :each do
			@subproduct = FactoryGirl.build(:subproduct, size: "medium", price: 14.99)
		end

		context "valid attributes" do
			it "located the requested @subproduct" do
				put :update, id: @subproduct, subproduct: FactoryGirl.build.attributes_for(:subproduct)
				assigns(:subproduct).should eq(@subproduct)
			end

			it "changes @subproduct's attributes" do
				put :update, id: @subproduct,
					subproduct: FactoryGirl.build.attributes_for(:subproduct, size: "medium", price: 14.99)
			end

		end

		context "invalid attributes" do

			it "located the appropiarte @subproduct" do
				put :update, id: @subproduct, subproduct: FactoryGirl.build.attributes_for(:invalid_subproduct)
				assigns(:subproduct).should eq(@subproduct)
			end

			it "does not change @subproduct's attributes" do

				put :update, id: @subproduct, subproduct: FactoryGirl.build.attributes_for(:subproduct, size: "medium", price: nil)
				@subproduct.reload
				@subproduct.size.should_not eq("medium")
				@subproduct.price.should_not eq("14.99")
			end

		end		

	end

	describe 'Delete #destroy' do

		@subproduct = FactoryGirl.build(:subproduct)

		context "valid delete" do

			it "deletes the subproducts" do
				expect{
					delete :destroy, id: @subproduct
				}.to change(Subproduct, :count).by(-1)
			end
		end

	end

end