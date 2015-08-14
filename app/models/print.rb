class Print < ActiveRecord::Base
	belongs_to :user
	has_many :reviews, dependent: :destroy
	has_attached_file :image, styles: {large: "600x600>", medium: "400x600#", small: "150x150#", thumb: "100x100#"}, :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	has_many :pledges, dependent: :destroy
	has_many :users, through: :pledges
	has_one :product

	def average_review
		reviews = Review.where(print_id: self.id)
		if reviews.blank?
			self.average_review = 0
		else 
			self.average_review = self.reviews.average(:rating)
		end
	end

	def pledge_count
		if self.pledges.blank?
			return 0
		else
			self.pledges.length
		end

	end

	def s3_credentials
	  	{:bucket => "artware", :access_key_id => "AKIAJXZAAVX5X6T3T34A", :secret_access_key => "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"}
	end

private

	def update_pledge_count
		self[:pledge_count] = pledge_count
		self.save
	end

end
