require 'spec_helper'
require 'rails_helper'

describe Print do

  it "has a valid FactoryGirl" do
    build(:print).should be_valid
  end

  it "is invalid without an name" do
  	build(:print, name: nil).should_not be_valid
  end
  it "is invalid without an description" do
  	build(:print, description: nil).should_not be_valid
  end
  it "is invalid with a duplicate name" do

    print = create(:print)
    build(:print, name: print.name).should_not be_valid

  end
end
