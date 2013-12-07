class Account::UserProfileEditType < User
  include ApplicationType

  permit :email, :first_name, :last_name, :avatar, :remove_avatar, :phone
end
