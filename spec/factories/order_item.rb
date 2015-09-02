require 'faker'

FactoryGirl.define do
  factory :order_item do |f|


    f.unit_price {Faker::Number.decimal(2)}
    f.quantity {Faker::Number.between(1, 10)}
  end
end