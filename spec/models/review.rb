require 'spec_helper'

describe Review	do
	it "has a valid factory" do
    	Factory.create(:review).should be_valid
  	end

  	it "is invalid without an comment" do
  		Factory.build(:review, comment: nil).should_not be_valid
  	end

  	it "is invalid without an rating" do
  		Factory.build(:review, rating: nil).should_not be_valid
  	end



  	it "should not exist without an user" do
  		Factory.build(:review, user_id: nil).should_not be_valid
  	end

  	it "should not exist without a print" do
  		Factory.build(:review, print_id: nil).should_not be_valid
  	end



end