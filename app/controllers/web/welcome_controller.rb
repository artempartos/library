class Web::WelcomeController < Web::ApplicationController
  layout 'layouts/web/welcome'

  skip_before_action :authenticate_user!
  def index
    @books = Book.web.limit(8)
    @companies = Company.web.limit(8)
  end
end
