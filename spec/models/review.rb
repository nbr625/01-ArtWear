require 'spec_helper'
require 'rails_helper'

describe Review	do
	it "has a valid FactoryGirl" do
    	build(:review).should be_valid
  	end

  	it "is invalid without an comment" do
  		build(:review, comment: nil).should_not be_valid
  	end

  	it "is invalid without an rating" do
  		build(:review, rating: nil).should_not be_valid
  	end





end