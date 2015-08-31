require 'faker'


FactoryGirl.define do
  factory :print do |f|
    f.name {Faker::Book.title}
    f.description {Faker::Name.name}

  end
end