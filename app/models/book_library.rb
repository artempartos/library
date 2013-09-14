class BookLibrary < ActiveRecord::Base
  belongs_to :librariable, polymorphic: true
  has_many :book_library_relationships, dependent: :destroy
  has_many :books, through: :book_library_relationships

  def state_of(book)
    book_library_relationships.where{ book_id == book }.state
  end
end
