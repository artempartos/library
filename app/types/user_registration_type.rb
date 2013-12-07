class UserRegistrationType < User
  include ApplicationType

  validates :accept_agreement, acceptance: true
  validates :password, presence: true

  permit :email, :password, :accept_agreement,
         :first_name, :last_name, :avatar, :login, :phone

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end

end