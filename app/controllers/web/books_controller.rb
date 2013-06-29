class Web::BooksController < Web::ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    puts params[:book]
    @book = Book.new(params[:book])
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end
end
