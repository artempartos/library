class Web::Books::ApplicationController < Web::ApplicationController

  layout 'layouts/web/books/application'
  helper_method :resource_book

  private

  def resource_book
    @book ||= Book.find(params[:book_id])
  end
end
