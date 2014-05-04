# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    sequence(:name) {|n| "name_#{n}"}
  end
end


FactoryGirl.define do
  factory :departure, class: "Departure", parent: :place do
    sequence(:name) {|n| "departure_name_#{n}"}
  end
end


FactoryGirl.define do
  factory :destination, class: "Destination", parent: :place do
    sequence(:name) {|n| "destination_name_#{n}"}
  end
end