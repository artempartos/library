class BookAuthorizer < ApplicationAuthorizer
  class << self
    def creatable_by?(user)
      !user.guest?
    end

    def readable_by?(user)
      true
    end
  end

  def readable_by?(user)
    # TODO: Add state to book
    resource.active?
  end

  def managable_by?(user)
    updatable_by?(user)
  end

  def updatable_by?(user)

  end

  def subscribable_by?(user)
    @company = user.companies.first
    return false unless @company.present?

    @library = user.current_library
    @books = @library.books

    if @books.include?(resource)
      @book = @books.find(resource)
      @ref = @library.book_library_book_relationships.where(book_id: @book).first
      if @ref.available?
        if user.read_books.include?(resource) || user.wait_books.include?(resource)
          return false
        else
          return true
        end
      else
        return false
      end
    else
      return false
    end
  end
end
