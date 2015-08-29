require 'spec_helper'

describe User do
	it "has a valid FactoryGirl" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without an email" do
  	FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  it "is invalid without an username" do
  	FactoryGirl.build(:user, username: nil).should_not be_valid
  end
  it "should not allow duplicate emails per contact" do
  	user = FactoryGirl.build(:user)
  	FactoryGirl.build(:email, user: user, email: "niberrizbe@gmail.com")
  	FactoryGirl.build(:email, user: user, email: "niberrizbe@gmail.com").should_not be_valid
  end

  it "should not allow duplicate usernames per user" do
  	user = FactoryGirl.build(:user)
  	FactoryGirl.build(:username, user: user, username: "Kight Kolas")
  	FactoryGirl.build(:username, user: user, username: "Kight Kolas").should_not be_valid
  end

end