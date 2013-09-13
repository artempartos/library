class ApplicationController < ActionController::Base
  include Concerns::AuthManagment

  helper_method :current_user, :signed_in?
end
