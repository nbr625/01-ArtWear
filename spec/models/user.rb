require 'spec_helper'
require 'rails_helper'

describe User do
	it "has a valid FactoryGirl" do
    build(:user).should be_valid
  end
  it "is invalid without an email" do
  	build(:user, email: nil).should_not be_valid
  end
  it "is invalid without an username" do
  	build(:user, username: nil).should_not be_valid
  end


end