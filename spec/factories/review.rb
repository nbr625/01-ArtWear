

FactoryGirl.define do
  factory :review do
    rating 4
    comment "Phenomenal"
    user_id 3
    print_id 3
    flag_count 0
    pledge_count 0
  end
end