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
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :storage => :s3
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
