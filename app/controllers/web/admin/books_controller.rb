class Web::Admin::BooksController < Web::ApplicationController
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result.by_updated_at
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to admin_books_path
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end

  def tagged
    if params[:tag].present?
      @books = Book.tagged_with(params[:tag])
    else
      @books = Book.scoped
    end
    @q = @books.ransack(params[:q])
    render 'index'
  end
end
