class UserRegistrationType < User
  attr_accessible :email, :password, :password_confirmation
end