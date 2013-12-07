# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [:creator] do
    password
    password_confirmation { password }
    first_name
    last_name
    email
    login

    after(:build) do |u|
      u.confirm
    end

    after(:create) do |u|
      u.create_library
    end
  end
end
