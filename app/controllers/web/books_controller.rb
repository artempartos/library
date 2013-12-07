class Web::BooksController < Web::ApplicationController
  def index
    @books = current_user.current_library.books.order('created_at DESC')
  end

  def create
    @book = BookEditType.new(params[:book])
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def new
    @book = BookEditType.new
  end

  def edit
    @book = resource_book
  end

  def show
    @book = resource_book
    @company = current_user.companies.first
    if @company.present?
      @library = @company.library
      #@books = @library.books
      @ref = @library.book_library_book_relationships.find_by(book_id: @book)
      @subscription = current_user.user_book_relationships.find_by(book_library_book_relationship_id: @ref)
      @watchers = @ref.try(:watchers)
    end
    @new_comment = @book.comments.build
  end

  def update
    @book = resource_book.becomes BookEditType

    if @book.update(params[:book])

      # FIXME use  flasher
      # f(:success)
      # redirect_to edit_book_path(@book)
      redirect_to @book
    else
      # f(:error)
      render :edit
    end
  end

  def destroy
    @book = resource_book
    @book.unpublish
    redirect_to books_path
  end

  private
  def resource_book
    Book.find(params[:id])
  end
end
