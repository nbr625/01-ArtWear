require 'spec_helper'
require 'rails_helper'

describe Product do
    it "has a valid FactoryGirl" do
  	    build(:product).should be_valid
    end

	it "is invalid without an name" do
		build(:product, name: nil).should_not be_valid
	end
	it "is invalid without a description" do
		build(:product, description: nil).should_not be_valid
	end
	it "is invalid without an creator" do
		build(:product, creator: nil).should_not be_valid
	end
	it "is invalid with a duplicate name" do

    	product = create(:product)
    	build(:product, name: product.name).should_not be_valid

 	end


	
end