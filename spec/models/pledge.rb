require 'spec_helper'
require 'rails_helper'

describe Pledge do
	it "has a valid FactoryGirl" do
    	build(:pledge).should be_valid
  	end

end