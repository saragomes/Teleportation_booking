# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :passenger do
    sequence(:first_name) {|n| "first_name_#{n}"}
	sequence(:last_name) {|n| "last_name_#{n}"}
    sequence(:email) {|n| "MyString#{n}@teleportation.com"}
  end
end
