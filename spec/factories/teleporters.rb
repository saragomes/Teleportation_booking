# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teleporter do
    sequence(:name) {|n| "teleporter_name_#{n}"}
    departure_date Time.now
  end
end
