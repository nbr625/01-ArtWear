require 'faker'

FactoryGirl.define do
  factory :product do |f|
    f.name {Faker::Book.title}
    f.description {Faker::Lorem.paragraph}
    f.creator {Faker::Book.author}
    f.on_sale false
    
  end

  factory :on_sale do |f|
    f.name {Faker::Book.title}
    f.description {Faker::Lorem.paragraph}
    f.creator {Faker::Book.author}
    f.on_sale true
   
  end

end