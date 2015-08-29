require 'faker'

FactoryGirl.define do
  factory :print do |f|
    f.name {Faker::Book.title}
    f.description {Faker::Name.name}
    f.rating {Faker::Number.between(1, 5)}
    f.user_id {Faker::Number.between(1, 30)}
    f.average_review {Faker::Number.between(1, 5)}
    f.flag_count {Faker::Number.between(0, 10)}
    f.pledge_count {{Faker::Number.between(0, 10)}}
  end
end