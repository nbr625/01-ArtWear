require 'faker'
FactoryGirl.define do
  factory :order_item do |f|
    f.subproduct_id f.user_id {Faker::Number.between(1, 30)}

    f.unit_price {Faker::Number.decimal(2)}
    f.quantity {Faker::Number.between(1, 10)}
    f.user_id {Faker::Number.between(1, 10)}
    f.total_price {Faker::Number.decimal(2)}
  end
end