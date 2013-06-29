FactoryGirl.define do
  sequence :string, aliases: [:text] do |n|
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

  sequence :id, aliases: [:number] do |n|
    n
  end

  sequence :year do |n|
    1000 + n
  end
end
