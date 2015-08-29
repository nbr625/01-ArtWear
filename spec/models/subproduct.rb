require 'spec_helper'

describe Subproduct do
	it "has a valid factory" do
    	Factory.create(:subproduct).should be_valid
  	end	

  	
  	it "should belong to a product" do
  		Factory.build(:subproduct, product_id: nil).should_not be_valid
  	end
  	
  	it "is invalid without an name" do
  		Factory.build(:subproduct, name: nil).should_not be_valid
  	end
  	it "is invalid without an size" do
  		Factory.build(:subproduct, size: nil).should_not be_valid
  	end
  	it "is invalid without an price" do
  		Factory.build(:subproduct, price: nil).should_not be_valid
  	end

end