class UserPasswordRemindType
  include ApplicationTypeWithoutActiveRecord

  attribute :email, String

  validates :email, presence: true, email: true
  validate :check_user, if: :email

  def check_user
    if !user
      errors.add(:email, :user_not_found)
    end
  end

  def user
    User.active.where(email: email.mb_chars.downcase).first
  end
end