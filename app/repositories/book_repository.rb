module BookRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :busy, where(state: :busy)
    scope :free, where(state: :free)
    scope :in_rent, ->(user) do
      where(state: :busy, holder_id: user.id)
    end
  end
end
