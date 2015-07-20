class Product < ActiveRecord::Base
	has_attached_file :image, styles: {large: "600x600>", medium: "300x300#", thumb: "100x100#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	belongs_to :user
	has_many :reviews, dependent: :destroy
	has_many :products
	has_many :subproducts, dependent: :destroy

	def self.recent
  		where('created_at > ?', Time.now-30.days.ago).order("created_at desc").first(10)
	end

	
end
