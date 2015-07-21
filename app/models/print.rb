class Print < ActiveRecord::Base
	belongs_to :user
	has_many :reviews, dependent: :destroy
	has_attached_file :image, styles: {large: "600x600>", medium: "300x300#", thumb: "100x100#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	before_save :update_subtotal


	def average_review
		rev_sum = reviews.collect { |review| review.blank? ? 0 : review.rating }.sum
		rev_avg = rev_sum/(reviews.length).round(2)
		return rev_avg
	end

private
	
	def update_average_review
		self[:average_review] = average_review
	end

end
