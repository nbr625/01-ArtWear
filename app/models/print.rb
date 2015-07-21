class Print < ActiveRecord::Base
	belongs_to :user
	has_many :reviews, dependent: :destroy
	has_attached_file :image, styles: {large: "600x600>", medium: "300x300#", thumb: "100x100#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


	def average_review
		rev_sum = reviews.collect { |review| review.blank? ? 0 : review.rating }.sum
		if rev_sum > 0
			rev_avg = rev_sum/(reviews.length).round(2)
			return rev_avg
		else
			return 0
		end
	end

	def flag_print
		self[:flag_count] += 1
	end


private
	
	def update_average_review
		self[:average_review] = average_review
	end

end
