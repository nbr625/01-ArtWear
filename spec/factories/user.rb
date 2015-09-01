require 'faker'

FactoryGirl.define do
  factory :user do |f|
  	f.username {Faker::Name.first_name}
    f.email { Faker::Internet.email }
    f.admin false
    f.biography "Gretest person ever"
   	f.password "password"
    f.id 35
  end

  factory :admin, class: User do
  	username {Faker::Name.first_name}
  	email { Faker::Internet.email }
  	admin true
  	biography "The one greater than the greatest"
  	password "1234neverguess"
  	id 36

  end
end