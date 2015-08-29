require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email {Faker::Internet.email}
    f.admin true
    f.avatar {Faker::Avatar.image}
    f.username "The Greatest"
    f.biography {Faker::Lorem.paragraph}
    f.password "password"
  end
end