require 'spec_helper'

describe Order do
	it "has a valid factory" do
    	Factory.create(:order).should be_valid
  	end

  	it "should not exist without an order_status" do
  		Factory.build(:order, order_status_id: nil).should_not be_valid
  	end

  	

	
end