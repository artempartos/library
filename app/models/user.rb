class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :email, uniqueness: true, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true

  mount_uploader :avatar, AvatarUploader

  state_machine initial: :waiting_confirmation do
    state :waiting_confirmation
    state :banned
    state :active

    event :confirm do
      transition [:waiting_confirmation, :banned] => :active
    end

    event :deactivate do
      transition [:waiting_confirmation, :active] => :inactive
    end
  end

  include UserRepository

  def generate_confirmation_token
    self.confirmation_token = SecureHelper.generate_token
  end

  def generate_reset_password_token
    self.reset_password_token = SecureHelper.generate_token
  end

  def can_reset_password?
    active?
  end

  def guest?
    false
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
