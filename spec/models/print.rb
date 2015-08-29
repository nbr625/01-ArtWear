require 'spec_helper'

describe Print do
	it "has a valid FactoryGirl" do
    	FactoryGirl.build(:print).should be_valid
  	end
	
	it "is invalid without an name" do
  		FactoryGirl.build(:print, name: nil).should_not be_valid
  	end
  	it "is invalid without an description" do
  		FactoryGirl.build(:print, description: nil).should_not be_valid
  	end

  	it "should not exist without an user" do
  		FactoryGirl.build(:print, user_id: nil).should_not be_valid
  	end

  	it "should not allow duplicate names per print" do
  		print = FactoryGirl.build(:print)
  		FactoryGirl.build(:name, print: print, name: "Masterpiece")
  		FactoryGirl.build(:name, print: print, name: "Masterpiece").should_not be_valid
  	end


end