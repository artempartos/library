module CompanyRepository
  extend ActiveSupport::Concern

  include UsefullScopes

  included do
    state_machine.states.each do |s|
      scope s.name, -> { where(state: s.name) }
    end
    scope :web, -> { active }
  end
end
