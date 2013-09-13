# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    password
    password_confirmation { password }
    first_name
    last_name
    email
    login
  end
end