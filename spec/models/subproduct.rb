require 'spec_helper'
require 'rails_helper'

describe Subproduct do
  it "has a valid FactoryGirl" do
  	build(:subproduct).should be_valid
	end	

	
	it "is invalid without an name" do
		build(:subproduct, name: nil).should_not be_valid
	end
	it "is invalid without an size" do
		build(:subproduct, size: nil).should_not be_valid
	end
	it "is invalid without an price" do
		build(:subproduct, price: nil).should_not be_valid
	end

end