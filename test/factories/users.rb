FactoryGirl.define do
  factory :user do
    email {generate :email}
    password {generate :string }
    password_confirmation { password }
    factory :admin_user do
      admin true
    end

  end
end
