class Web::BooksController < Web::ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @page = PageType.find(params[:id])

    if @page.update_attributes(params[:page])
      f(:success)
      redirect_to action: :edit
    else
      f(:error)
      render :edit
    end

  end

  def new
    @book = Book.new
    @book.build_image
  end

  def create
    puts params[:book]
    @book = Book.new(params[:book])
    if @book.save
      redirect_to root_path
    else
      @book.build_image
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end
end
