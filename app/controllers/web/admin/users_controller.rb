class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = UserRegistrationType.new(params[:user])
    if @user.save
      f(:success)
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to admin_users_path
  end
end