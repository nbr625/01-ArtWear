require 'spec_helper'

describe Product do
	it "has a valid FactoryGirl" do
    	FactoryGirl.create(:product).should be_valid
  	end

  	it "is invalid without an name" do
  		FactoryGirl.build(:product, name: nil).should_not be_valid
  	end
  	it "is invalid without a description" do
  		FactoryGirl.build(:product, description: nil).should_not be_valid
  	end
  	it "is invalid without an creator" do
  		FactoryGirl.build(:product, creator: nil).should_not be_valid
  	end
  	

  	it "should not allow duplicate names per product" do
  		product = FactoryGirl(:product)
  		FactoryGirl(:name, product: product, name: "Masterpiece")
  		FactoryGirl.build(:name, product: product, name: "Masterpiece").should_not be_valid
  	end

	
end