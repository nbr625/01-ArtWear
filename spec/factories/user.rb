

FactoryGirl.define do
  factory :user do
  	username "The Greatest"
    email "person@gmail.com"
    admin false
    biography "Gretest person ever"
   	password "password"
    id 35
  end

  factory :admin, class: User do
  	username "Admin"
  	email "admin@gmail.com"
  	admin true
  	biography "The one greater than the greatest"
  	password "1234neverguess"
  	id 36
  	
  end
end