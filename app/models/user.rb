class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :books

  validates :email, uniqueness: true, presence: true, email: true

  state_machine initial: :waiting_confirmation do
    state :waiting_confirmation
    state :inactive
    state :active

    event :confirm do
      transition from: :waiting_confirmation, to: :active
    end

    event :deactivate do
      transition from: :active, to: :inactive
    end
  end

  def to_s
    email
  end
end
