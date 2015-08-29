class Print < ActiveRecord::Base
	belongs_to :user
	has_many :reviews, dependent: :destroy
	has_attached_file :image, styles: {large: "800x800>", medium: "300x300#", small:"200x200#", thumb: "100x100#"}, :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, :url =>':s3_domain_url', 
                    :path => '/:class/:attachment/:id_partition/:style/:filename'
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	has_many :pledges, dependent: :destroy
	has_many :users, through: :pledges
	has_one :product

	validates :name,  presence: true
	validates :description,  presence: true
	validates :product,  presence: true


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
