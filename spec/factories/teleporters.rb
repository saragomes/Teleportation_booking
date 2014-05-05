# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teleporter do
    sequence(:name) {|n| "teleporter_name_#{n}"}
    departure
  	destination
    departure_date Time.now + 10.second
  end
end
