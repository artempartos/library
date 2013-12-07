module BookRepository
  extend ActiveSupport::Concern

  included do
    state_machine.states.each do |s|
      scope s.name, -> { where(state: s.name) }
    end
    scope :web, -> { published }
  end
end
