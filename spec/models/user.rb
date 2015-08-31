require 'spec_helper'

describe User do
	it "has a valid FactoryGirl" do
    Factory.create(:user).should be_valid
  end
  it "is invalid without an email" do
  	Factory.build(:user, email: nil).should_not be_valid
  end
  it "is invalid without an username" do
  	Factory.build(:user, username: nil).should_not be_valid
  end
  it "should not allow duplicate emails per contact" do
  	user = Factory.build(:user)
  	Factory.build(:email, user: user, email: "niberrizbe@gmail.com")
  	Factory.build(:email, user: user, email: "niberrizbe@gmail.com").should_not be_valid
  end

  it "should not allow duplicate usernames per user" do
  	user = Factory.build(:user)
  	Factory.build(:username, user: user, username: "Kight Kolas")
  	Factory.build(:username, user: user, username: "Kight Kolas").should_not be_valid
  end

end