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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      f(:success)
      redirect_to edit_admin_user_path(@user)
    else
      f(:error)
      render :edit
    end
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
