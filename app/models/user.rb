class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products
  has_many :prints
  has_many :pledges
  has_many :reviews, dependent: :destroy
  # Paperclip avatar picture requirement.
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  
  def s3_credentials
      {:bucket => "artware", :access_key_id => "AKIAJXZAAVX5X6T3T34A", :secret_access_key => "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"}
  end
end
