class Web::Account::LibrariesController < Web::Account::ApplicationController
  def show
    @library = resource_library
    @books = resource_library.books.order('created_at DESC')
  end

  def create
    @library = current_user.current_library
    @book = Book.web.find_by_id params[:book][:id]

    @library.books << @book if @book
    @library.save
    redirect_to_back_or account_library_path
  end

  def resource_library
    current_user.current_library
  end

end
