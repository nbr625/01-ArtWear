require 'spec_helper'
require 'rails_helper'

describe OrderItem do
	it "has a valid FactoryGirl" do
    build(:order_item).should be_valid
  end

  it "is invalid without a unit_price" do
  	build(:order_item, unit_price: nil).should_not be_valid
  end
  it "is invalid without a quantity" do
  	build(:order_item, quantity: nil).should_not be_valid
  end

  it "is invalid if quantity is not a number" do
  	build(:order_item, quantity: "three").should_not be_valid
  end


end