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

	def pledge_count
		if self.pledges.blank?
			return 0
		else
			self.pledges.length
		end

	end

private

	def update_pledge_count
		self[:pledge_count] = pledge_count
		self.save
	end

end
