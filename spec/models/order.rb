require 'spec_helper'

describe Order do
	it "has a valid FactoryGirl" do
    	FactoryGirl.create(:order).should be_valid
  	end


  	

	
end