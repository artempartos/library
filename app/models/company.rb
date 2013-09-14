class Company < ActiveRecord::Base

  validates :name, presence: true

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

end
