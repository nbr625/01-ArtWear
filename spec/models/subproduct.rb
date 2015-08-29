require 'spec_helper'

describe Subproduct do
	it "has a valid FactoryGirl" do
    	FactoryGirl.create(:subproduct).should be_valid
  	end	

  	
  	it "is invalid without an name" do
  		FactoryGirl.build(:subproduct, name: nil).should_not be_valid
  	end
  	it "is invalid without an size" do
  		FactoryGirl.build(:subproduct, size: nil).should_not be_valid
  	end
  	it "is invalid without an price" do
  		FactoryGirl.build(:subproduct, price: nil).should_not be_valid
  	end

end