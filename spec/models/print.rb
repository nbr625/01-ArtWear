require 'spec_helper'
require 'rails_helper'

describe Print do

	it "is invalid without an name" do
  	build(:print, name: nil).should_not be_valid
  end
  it "is invalid without an description" do
  	build(:print, description: nil).should_not be_valid
  end

	it "should not exist without an user" do
  	build(:print, user_id: nil).should_not be_valid
  end


end