class Product < ActiveRecord::Base
	has_attached_file :image, styles: {large: "800x800>", medium: "150x150#", small:"200x200#", thumb: "100x100#"}, :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, :url =>':s3_domain_url', 
                    :path => '/:class/:attachment/:id_partition/:style/:filename'
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	belongs_to :user
	belongs_to :print
	has_many :reviews, dependent: :destroy
	has_many :subproducts, dependent: :destroy
	validates :name,  presence: true, uniqueness: true
	validates :description,  presence: true
	validates :creator,  presence: true
	


	

	def s3_credentials
	  	{:bucket => "artware", :access_key_id => "AKIAJXZAAVX5X6T3T34A", :secret_access_key => "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"}
	end
end
