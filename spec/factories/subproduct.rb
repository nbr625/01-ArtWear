require 'faker'

FactoryGirl.define do
  factory :subproduct do |f|
    f.quantity {Faker::Number.between(1, 10)}
    f.size "medium"
    f.product_id {Faker::Number.between(1, 30)}
    f.active "true"
    f.name {Faker::Lorem.sentence}
    f.price {Faker::Commerce.price}
  end
end