# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title Faker::Company.name
    content Faker::Lorem.sentence(3)
  end
end
