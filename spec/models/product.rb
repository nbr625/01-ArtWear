require 'spec_helper'

describe Product do
	it "has a valid factory" do
    	Factory.create(:product).should be_valid
  	end
  	
	
end