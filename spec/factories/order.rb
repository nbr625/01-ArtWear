require 'faker'

FactoryGirl.define do
  factory :order do |f|
    f.subtotal {Faker::Number.decimal(2)}
    f.tax {Faker::Number.decimal(2)}
    f.shipping {Faker::Number.decimal(2)}
    f.order_status {Faker::Number.between(1, 4)}
  end
end