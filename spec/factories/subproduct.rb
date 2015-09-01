require 'faker'

FactoryGirl.define do
  factory :subproduct do |f|
    f.quantity 2
    f.size "medium"
    f.product_id 4
    f.active "true"
    f.name "Black Shirt"
    f.price 14.99
  end
end