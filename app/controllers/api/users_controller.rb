class Api::UsersController < Api::ApplicationController

  before_filter :authenticate_user!

  def show
    @user = current_user
    respond_with @user
  end

end
