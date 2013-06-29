class Api::ApplicationController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
end
