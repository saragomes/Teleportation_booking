# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    passenger_id 1
    teleporter_id 1
    departure_point 1
    destination_point 1
  end
end
