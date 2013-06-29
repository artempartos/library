class Web::UsersController < Web::ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.active.where(login: params[:id]).first!
  end

  def new
    @user = User.new
  end

  def create
    puts params[:user]
    @user = UserRegistrationType.new(params[:user])
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end
end