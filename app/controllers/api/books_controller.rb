class Api::BooksController < Api::ApplicationController
  def index
    @books = Book.all.ransack(params[:q]).result
    respond_with @books
  end
end
