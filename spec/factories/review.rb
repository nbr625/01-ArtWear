require 'faker'

FactoryGirl.define do
  factory :review do |f|
    f.rating {Faker::Number.between(1, 5)}
    f.comment {Faker::Lorem.paragraph}
    f.user_id {Faker::Number.between(1, 30)}
    f.product_id {Faker::Number.between(1, 30)}
    f.print_id {Faker::Number.between(1, 30)}
    f.flag_count {{Faker::Number.between(0, 10)}}
  end
end