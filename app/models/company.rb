class Company < ActiveRecord::Base
  include Authority::Abilities

  belongs_to :creator, class_name: User

  has_one :library, as: :librariable, class_name: BookLibrary

  has_many :user_company_relationships, dependent: :destroy
  has_many :employees,                  through: :user_company_relationships, source: :user

  validates :name, presence: true
  validates :creator, presence: true

  mount_uploader :logo, ::LogoUploader

  state_machine :state, initial: :active do
    state :active
    state :suspended

    event :activate do
      transition any - [:active] => :active
    end

    event :suspend do
      transition any - [:suspended] => :suspended
    end
  end

  include CompanyRepository

  def to_s
    "#{name}"
  end
end
