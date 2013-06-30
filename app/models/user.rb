class User < ActiveRecord::Base
  attr_accessible :company_attributes

  has_secure_password
  has_many :comments
  has_one :company

  accepts_nested_attributes_for :company, :reject_if => :all_blank, :allow_destroy => true

  attr_accessible :login, :email, :password

  validates :login, :presence => true,
                    :uniqueness => true

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
