class Web::BooksController < Web::ApplicationController
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result.by_updated_at
  end

  def show
    @book = Book.find(params[:id])
  end
end
