require 'spec_helper'

describe Product do
	it "has a valid factory" do
    	Factory.create(:product).should be_valid
  	end

  	it "is invalid without an name" do
  		Factory.build(:product, name: nil).should_not be_valid
  	end
  	it "is invalid without a description" do
  		Factory.build(:product, description: nil).should_not be_valid
  	end
  	it "is invalid without an creator" do
  		Factory.build(:product, creator: nil).should_not be_valid
  	end
  	
  	it "should not exist without an user" do
  		Factory.build(:product, user_id: nil).should_not be_valid
  	end
  	it "should not exist without a print" do
  		Factory.build(:product, print_id: nil).should_not be_valid
  	end

  	it "should not allow duplicate names per product" do
  		product = Factory(:product)
  		Factory(:name, product: product, name: "Masterpiece")
  		Factory.build(:name, product: product, name: "Masterpiece").should_not be_valid
  	end

	
end