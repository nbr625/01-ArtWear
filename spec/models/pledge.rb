require 'spec_helper'

describe Pledge do
	it "has a valid FactoryGirl" do
    	FactoryGirl.create(:pledge).should be_valid
  	end

end