class Api::UsersController < Api::ApplicationController

  def show
    @user = current_user
    respond_with @user
  end

end
