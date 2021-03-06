class Web::SessionsController < Web::ApplicationController
  skip_before_action :authenticate_user!

  def new
    redirect_to root_path if signed_in?
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new(params[:user_sign_in_type])

    if @session.valid?
      user = @session.user
      sign_in(user)
      f(:success)
      redirect_to_back_or root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    f(:success)
    redirect_to_back_or root_path
  end

end
