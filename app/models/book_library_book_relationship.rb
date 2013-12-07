class BookLibraryBookRelationship < ActiveRecord::Base

  belongs_to :book_library
  belongs_to :book
  belongs_to :reader_relation, class_name: UserBookRelationship
  has_one :reader,            through: :reader_relation, source: :user

  has_many :user_book_relationships
  has_many :watchers,         -> { where(user_book_relationships: { state: :waiting }) }, through: :user_book_relationships, source: :user

  acts_as_taggable
  acts_as_commentable

  state_machine :state, initial: :available do
    state :available
    state :borrowed

    event :return do
      transition borrowed: :available
    end

    event :borrow do
      transition available: :borrowed
    end

    after_transition on: :return, :do => :clean_reader
  end

  def clean_reader
    reader_user = reader_relation
    if reader_user.present?
      reader_user.to_library
      reader_user.save
    end

    reader_relation_id = nil
    save
  end
end
