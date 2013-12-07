class BookEditType < Book
  include ApplicationType

  validates :name, presence: true
  validates :author, presence: true
  validates :year, presence: true

  permit :name, :description, :author, :state_event, :book_cover, :book_cover_cache, :year, :isbn, :tag_list
end
