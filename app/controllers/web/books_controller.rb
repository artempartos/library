class Web::BooksController < Web::ApplicationController
  def index
    @books = Book.web
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
