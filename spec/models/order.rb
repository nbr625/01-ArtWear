require 'spec_helper'
require 'rails_helper'

describe Order do
	it "has a valid FactoryGirl" do
    	create(:order).should be_valid
  	end


  	

	
end