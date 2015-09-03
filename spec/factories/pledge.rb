require 'faker'

FactoryGirl.define do
  factory :pledge do |f|
    f.agreement true
    f.print

  end
end