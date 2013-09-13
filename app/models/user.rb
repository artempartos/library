class User < ActiveRecord::Base
  include Authority::UserAbilities
  include UserRepository

  has_secure_password validations: false

  has_many :own_companies,              dependent: :destroy, foreign_key: :creator_id
  has_many :user_company_relationships, dependent: :destroy
  has_many :companies,                  through: :user_company_relationships

  validates :email,           presence: true, uniqueness: true, email: true
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :password_digest, presence: true

  mount_uploader :avatar, AvatarUploader

  state_machine initial: :waiting_confirmation do
    state :waiting_confirmation
    state :banned
    state :active

    event :confirm do
      transition [:waiting_confirmation, :banned] => :active
    end

    event :ban do
      transition [:waiting_confirmation, :active] => :banned
    end

  end

  def generate_confirmation_token
    self.confirmation_token = SecureHelper.generate_token
  end

  def generate_reset_password_token
    self.reset_password_token = SecureHelper.generate_token
  end

  def can_reset_password?
    active?
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
