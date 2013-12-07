class Web::WelcomeController < Web::ApplicationController
  layout 'layouts/web/welcome'

  skip_before_action :authenticate_user!
  def index
    @books = Book.web.limit(4).order("RANDOM()")
  end
end
