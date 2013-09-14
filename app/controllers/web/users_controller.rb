class Web::UsersController < Web::ApplicationController

  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new(params[:user])
    @user.generate_confirmation_token
    if @user.save
      UserMailer.confirmation_instructions(@user).deliver
      f(:success)
      redirect_to root_path
    else
      f(:error)
      render :new
    end
  end

  def confirm
    user = User.where(params.extract(:id, :confirmation_token)).first!
    if user.confirm
      sign_in user
      f(:success)
    else
      f(:error)
    end
    redirect_to root_path
  end

end