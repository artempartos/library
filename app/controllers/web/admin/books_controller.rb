class Web::Admin::BooksController < Web::Admin::ApplicationController
  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:page])
      f(:success)
      redirect_to edit_admin_book_path
    else
      f(:error)
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @book.build_image
    @book.build_e_book
  end

  def create
    puts params[:book]
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

    redirect_to admin_books_path
  end
end
