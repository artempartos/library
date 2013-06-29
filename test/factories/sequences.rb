FactoryGirl.define do
  sequence :string do |n|
    "string#{n}"
  end

  sequence :body do |n|
    "body#{n}"
  end

  sequence :name do |n|
    "name#{n}"
  end

  sequence :email do |n|
    "email_#{n}@mail.com"
  end
end
