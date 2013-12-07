class Book < ActiveRecord::Base
  include Authority::Abilities

  has_many :book_library_book_relationships,  dependent: :destroy
  has_many :book_libraries,                   through: :book_library_book_relationships

  has_many :reader_relations,                 through: :book_library_book_relationships
  has_many :readers,                          through: :reader_relations, source: :user

  # FIXME change :book_cover to :cover
  mount_uploader :book_cover, CoverUploader

  acts_as_taggable
  acts_as_commentable

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
