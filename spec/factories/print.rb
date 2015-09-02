require 'faker'


FactoryGirl.define do
  factory :print do |f|
    f.name {Faker::Book.title}
    f.description {Faker::Name.name}

  end

  factory :invalid_print do |f|
    f.name nil
    f.description nil

  end

  
end