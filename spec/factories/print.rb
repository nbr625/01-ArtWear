require 'faker'

FactoryGirl.define do
  factory :print do |f|
    f.name {Faker::Book.title}
    f.description {Faker::Name.name}
    f.id {Faker::Number.between(15, 30)}
  end
end