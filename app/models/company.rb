class Company < ActiveRecord::Base
  include Authority::Abilities

  mount_uploader :logo, LogoUploader

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
end
