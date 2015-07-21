class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	belongs_to :print

	def flag_review
		self[:flag_count] += 1
		self.save
	end

end
