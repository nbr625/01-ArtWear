require 'spec_helper'

describe Pledge do
	it "has a valid factory" do
    	Factory.create(:pledge).should be_valid
  	end

  	it "should not exist without an user" do
  		Factory.build(:pledge, user_id: nil).should_not be_valid
  	end
	
end