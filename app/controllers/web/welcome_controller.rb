class Web::WelcomeController < Web::ApplicationController
  skip_before_filter :authenticate_admin, :only => :new
  def index
    
  end
end
