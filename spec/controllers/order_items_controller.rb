require 'spec_helper'
require 'rails_helper'

describe OrderItemsController do


	describe "POST #create" do

		it "should redirect to root if the user is not signed in" do
			current_user = nil
			response.should redirect_to(root_url)
		end

		context "with attributes within parameters" do
			it "saves the order_item in the database" do
				expect{
					post :create, order_item: FactoryGirl.build.attributes_for(:order_item)
				}.to change(Order_items,:count).by(1)
			end
			it "redirect to the order_item index template" do
				post :create, order_item: FactoryGirl.build.attributes_for(:order_item)
				response.should redirect_to order_item.last
			end

		end

		context "with invalid attributes" do
			it "does not save the new order_item to the database" do
				expect{
					post :create, order_item: FactoryGirl.build.attributes_for(:invalid_order_item)
				}.to_not change(Order_items, :order_item)
			end
		end
	end

	describe "PUT update" do
		it "should redirect to root if the user is not signed in" do
			current_user = nil
			response.should redirect_to(root_url)
		end
		before :each do
			@order_item = FactoryGirl.build(:order_item, quantity: 2, unit_price: 19.99)
		end

		context "valid attributes" do
			it "located the requested @order_item" do
				put :update, id: @order_item, order_item: FactoryGirl.build.attributes_for(:order_item)
				assigns(:order_item).should eq(@order_item)
			end

			it "changes @order_item's attributes" do
				put :update, id: @order_item,
					order_item: FactoryGirl.build.attributes_for(:order_item, quantity: 2, unit_price: 19.99)
			end


		end

		context "invalid attributes" do

			it "located the appropiarte @order_item" do
				put :update, id: @order_item, order_item: FactoryGirl.build.attributes_for(:invalid_order_item)
				assigns(:order_item).should eq(@order_item)
			end

			it "does not change @order_item's attributes" do

				put :update, id: @order_item,
					order_item: FactoryGirl.build.attributes_for(:order_item, quantity: 2, unit_price: nil)
				@order_item.reload
				@order_item.quantity.should_not eq(2)
				@order_item.unit_price.should_not eq(19.99)
			end


		end		

	end

	describe 'Delete destroy' do

		before :each do
			@order_item = FactoryGirl.build(:order_item)
		end

		it "deletes the order_items" do
			expect{
				delete :destroy, id: @order_item
			}.to change(Order_items, :count).by(-1)
		end
	end

end