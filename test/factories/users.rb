FactoryGirl.define do
  factory :user do
    email {generate :email}
    password 'secret'
    password_confirmation 'secret'
    login {generate :string}
    factory :admin_user do
      admin true
    end

  end
end
