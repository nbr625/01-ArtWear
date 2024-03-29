require 'spec_helper'
require 'rails_helper'

describe OrderItemsController do


	describe "POST #create" do

		before(:each) do 
			sign_in	create(:user)
			@order = create(:order)

		end


		context "with attributes within parameters" do
			before(:each) {@order_item_attributes = attributes_for(:order_item)}
			it "saves the order_item in the database" do
				expect{
					post :create, order_item: @order_item_attributes
				}.to change(Order_item, :count).by(1)
			end


		end

		context "with invalid attributes" do
			it "does not save the new order_item to the database" do
				before(:each) {@invalid_order_item_attributes = attributes_for(:order_item, quantity: nil)}
				expect{
					post :create, order_item: @invalid_order_item_attributes
				}.to_not change(Order_item, :count)
			end
		end
	end

	describe "PUT update" do
		it "should redirect to root if the user is not signed in" do
			current_user = nil
			response.should redirect_to(root_url)
		end
		before :each do
			@order_item = build(:order_item, quantity: 2, unit_price: 19.99)
		end

		context "valid attributes" do
			it "located the requested @order_item" do
				put :update, id: @order_item, order_item: build.attributes_for(:order_item)
				assigns(:order_item).should eq(@order_item)
			end

			it "changes @order_item's attributes" do
				put :update, id: @order_item,
					order_item: build.attributes_for(:order_item, quantity: 2, unit_price: 19.99)
			end


		end

		context "invalid attributes" do

			it "located the appropiarte @order_item" do
				put :update, id: @order_item, order_item: build.attributes_for(:invalid_order_item)
				assigns(:order_item).should eq(@order_item)
			end

			it "does not change @order_item's attributes" do

				put :update, id: @order_item,
					order_item: build.attributes_for(:order_item, quantity: 2, unit_price: nil)
				@order_item.reload
				@order_item.quantity.should_not eq(2)
				@order_item.unit_price.should_not eq(19.99)
			end


		end		

	end


	describe 'Delete destroy' do

		it "deletes the order_items" do
			@order_item = create(:order_item)
			expect{
				delete :destroy, id: @order_item
			}.to change(Order_items, :count).by(-1)
		end
	end

end