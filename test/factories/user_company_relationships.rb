# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_company_relationship do
    user
    company
  end
end
