class CompanyAuthorizer < ApplicationAuthorizer
  class << self
    def creatable_by?(user)
      !user.guest?
    end

    def readable_by?(user)
      true
    end
  end

  def readable_by?(user)
    resource.active?
  end

  def managable_by?(user)
    updatable_by?(user)
  end

  def updatable_by?(user)

  end
end
