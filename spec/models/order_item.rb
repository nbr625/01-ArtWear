require 'spec_helper'

describe OrderItem do
	it "has a valid factory" do
    	Factory.create(:order_item).should be_valid
  	end

  	it "is invalid without a unit_price" do
  		Factory.build(:order_item, unit_price: nil).should_not be_valid
  	end
  	it "is invalid without a quantity" do
  		Factory.build(:order_item, quantity: nil).should_not be_valid
  	end


  	it "should not exist without an subproduct" do
  		Factory.build(:order_item, subproduct_id: nil).should_not be_valid
  	end
  	it "should not exist without an order" do
  		Factory.build(:order_item, order_id: nil).should_not be_valid
  	end
  	

  	it "should return total price" do
  		order_item = Factory.build(unit_price: 14.99, quantity: 2)
  		order_item.total_price.should == 29.98
  	end
	
end