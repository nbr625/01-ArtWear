class Subproduct < ActiveRecord::Base
	belongs_to :product
	has_many :order_items 
	default_scope {where(active: true)}
end
