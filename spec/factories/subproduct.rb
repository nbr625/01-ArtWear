require 'faker'
require 'database_cleaner'

FactoryGirl.define do
  factory :subproduct do |f|
    f.quantity {Faker::Number.between(1, 10)}
    f.size "small"
    f.active true
    f.name {Faker::Book.title}
    f.price 14.99
  end
end