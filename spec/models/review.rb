require 'spec_helper'

describe Review	do
	it "has a valid FactoryGirl" do
    	FactoryGirl.create(:review).should be_valid
  	end

  	it "is invalid without an comment" do
  		FactoryGirl.build(:review, comment: nil).should_not be_valid
  	end

  	it "is invalid without an rating" do
  		FactoryGirl.build(:review, rating: nil).should_not be_valid
  	end





end