require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email "person@gmail.com"
    f.admin true
    f.username "The Greatest"
    f.biography "Gretest person ever"
    f.password "password"
  end
end