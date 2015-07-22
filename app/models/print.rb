class Print < ActiveRecord::Base
	belongs_to :user
	has_many :reviews, dependent: :destroy
	has_attached_file :image, styles: {large: "600x600>", medium: "300x300#", thumb: "100x100#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	has_many :pledges, dependent: :destroy
	has_many :users, through: :pledges


	def average_review
		reviews = Review.where(print_id: self.id)
		if reviews.blank?
			self.average_review = 0
		else 
			self.average_review = self.reviews.average(:rating).round(2)
		end
	end
end
