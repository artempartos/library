class Book < ActiveRecord::Base
  include Authority::Abilities

  # FIXME change :book_cover to :cover
  mount_uploader :book_cover, CoverUploader

  state_machine :state, initial: :draft do
    state :published
    state :unpublished
    state :draft

    event :publish do
      transition [:unpublished, :draft] => :published
    end
    event :unpublish do
      transition [:published, :draft] => :unpublished
    end
    event :to_draft do
      transition [:published, :unpublished] => :draft
    end
  end

  include BookRepository

  def to_s
    name
  end
end
