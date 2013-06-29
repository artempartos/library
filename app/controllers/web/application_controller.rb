class Web::ApplicationController < ApplicationController
  protect_from_forgery with: :exception

  before_filter :authenticate_admin!
  skip_before_filter :authenticate_user!
end
