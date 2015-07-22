class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :print
  validates_presence_of :agreement, :message => " must accept"
end
