require 'faker'

FactoryGirl.define do
  factory :pledge do |f|
    f.agreement true
    f.id {Faker::Number.between(15, 30)}
  end
end