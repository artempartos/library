class Web::WelcomeController < Web::ApplicationController
  skip_before_filter :authenticate_user!
  def index

  end
end
