class Web::UsersController < Web::ApplicationController
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
      redirect_to root_path
    else
      render :new
    end
  end
end