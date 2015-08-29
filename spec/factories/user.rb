require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email {Faker::Internet.email}
    f.admin false
    f.avatar {Faker::Avatar.image}
    f.username {Faker::Internet.name}
    f.briography {Faker::Lorem.paragraph}
  end
end