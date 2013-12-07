module UserRepository
  extend ActiveSupport::Concern

  included do

    state_machine.states.each do |s|
      scope s.name, -> { where(state: s.name) }
    end

    scope :without_company, ->(company) { where.not(id: company.employees) }

  end
end