class ApplicationController < ActionController::Base
  include Concerns::AuthManagment
  include Concerns::FlashHelper

  helper_method :current_user, :signed_in?

  class << self
    def url_helpers(route_name, *args)
      Rails.application.routes.url_helpers.send route_name, args
    end
  end

end
