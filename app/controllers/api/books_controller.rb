class Api::BooksController < Api::ApplicationController
  def index
    @books = Book.scoped
    respond_with @books
  end

  def show
    @book = Book.includes(:comments).find(params[:id])
  end
end
