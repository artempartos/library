FactoryGirl.define do

  sequence :slug do |n|
    "slug#{n}"
  end

  sequence :name, aliases: [:title, :first_name, :last_name, :login] do |n|
    "name#{n}"
  end

  sequence :body do |n|
    "body#{n}"
  end

  sequence :integer do |n|
    n
  end

  sequence :password do |n|
    "email_#{n}@mail.com"
  end

  sequence :email do |n|
    "email_#{n}@mail.com"
  end
end