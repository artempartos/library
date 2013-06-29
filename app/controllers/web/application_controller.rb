class Web::ApplicationController < ApplicationController
  protect_from_forgery with: :exception

  skip_before_filter :authenticate_user!
end
