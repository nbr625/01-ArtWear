require 'spec_helper'

describe Print do
	it "has a valid factory" do
    	Factory.create(:print).should be_valid
  	end
	
	it "is invalid without an name" do
  		Factory.build(:print, name: nil).should_not be_valid
  	end
  	it "is invalid without an description" do
  		Factory.build(:print, description: nil).should_not be_valid
  	end

  	it "should not exist without an user" do
  		Factory.build(:print, user_id: nil).should_not be_valid
  	end

  	it "should not allow duplicate names per print" do
  		print = Factory(:print)
  		Factory(:name, print: print, name: "Masterpiece")
  		Factory.build(:name, print: print, name: "Masterpiece").should_not be_valid
  	end


end