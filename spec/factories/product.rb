require 'faker'

FactoryGirl.define do
  factory :product do |f|
    f.name {Faker::Book.title}
    f.description {Faker::Lorem.paragraph}
    f.user_id {Faker::Number.between(1, 30)}
    f.print_id {Faker::Number.between(1, 30)}
    f.creator {Faker::Book.author}
  end
end