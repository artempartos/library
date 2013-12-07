class BookLibrary < ActiveRecord::Base
  belongs_to :librariable, polymorphic: true
  has_many :book_library_book_relationships, dependent: :destroy
  has_many :books, through: :book_library_book_relationships

  has_many :subscribers, through: :book_library_book_relationships, source: :user_book_relationships

  def state_of(book)
    book_library_book_relationships.where{ book_id == book }.state
  end

  def to_s
    librariable.to_s
  end
end
