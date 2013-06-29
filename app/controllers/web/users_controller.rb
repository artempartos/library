class Web::UsersController < Web::ApplicationController
  skip_before_filter :authenticate_user!, :only => [ :new, :create ]

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
