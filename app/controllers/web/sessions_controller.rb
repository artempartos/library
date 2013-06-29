class Web::SessionsController < Web::ApplicationController
  skip_before_filter :authenticate_user!, :only => [ :new, :create ]
  def new
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new(params[:user_sign_in_type])

    if @session.valid?
      user = @session.user
      sign_in(user)
      f(:success)
      redirect_to params[:from] || root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    f(:success)
    redirect_to root_path
  end
end
