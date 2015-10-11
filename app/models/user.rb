class User < ActiveRecord::Base

  has_many :products, dependent: :destroy
  has_many :prints, dependent: :destroy
  has_many :pledges, dependent: :destroy
  has_many :reviews, dependent: :destroy

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  # Paperclip avatar picture requirement.
  has_attached_file :avatar, :styles => { :medium => "300x300>", :small => "", :thumb => "100x100>" }, :convert_options => {:small => "-gravity north -thumbnail 200x200^ -extent 200x200"}, :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, :url =>':s3_domain_url', 
                    :path => '/:class/:attachment/:id_partition/:style/:filename'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true


  def s3_credentials
      {:bucket => "artware", :access_key_id => "AKIAJXZAAVX5X6T3T34A", :secret_access_key => "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"}
  end
  
end
