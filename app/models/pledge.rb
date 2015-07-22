class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :print
end
