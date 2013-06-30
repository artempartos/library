class Api::BooksController < Api::ApplicationController
  def index
    @books = Book.scoped
  end

  def show
    @book = Book.includes(:comments).find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.holder = current_user
    @book.save
    @book.rent
    respond_with @book
  end
end
