class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	belongs_to :print
end
