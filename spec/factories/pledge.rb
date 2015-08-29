require 'faker'

FactoryGirl.define do
  factory :pledge do |f|
    f.agreement true
    f.user_id {Faker::Number.between(1, 30)}
    f.print_id {Faker::Number.between(1, 30)}
  end
end