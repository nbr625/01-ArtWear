require 'spec_helper'
require 'rails_helper'

describe OrderItem do
	it "has a valid FactoryGirl" do
    create(:order_item).should be_valid
  end

  it "is invalid without a unit_price" do
  	build(:order_item, unit_price: nil).should_not be_valid
  end
  it "is invalid without a quantity" do
  	build(:order_item, quantity: nil).should_not be_valid
  end



  	

  it "should return total price" do
  	order_item = build(:order_item, unit_price: 14.99, quantity: 2)
  	order_item.total_price.should == 29.98
  end
	
end