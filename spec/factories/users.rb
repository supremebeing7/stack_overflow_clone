# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username Faker::Internet.name
    password 'password'
    password_confirmation 'password'
  end
end
