require 'database_cleaner'
require 'faker'

FactoryGirl.define do
  factory :review do
    rating {Faker::Number.between(1, 5)}
    comment {Faker::Lorem.paragraph}
  end
end