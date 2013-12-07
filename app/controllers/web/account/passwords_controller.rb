class Web::Account::PasswordsController < Web::Account::ApplicationController
  # add_breadcrumb :edit, :edit_account_password
  skip_before_action :authenticate_user!, only: [:edit]
  def edit
    @user = UserPasswordConfirmationType.new
  end

  def update
    @user = UserPasswordConfirmationType.where(params.extract(:reset_password_token)).first!
    if @user.update(params[:user])
      sign_in @user
      f(:success)
      return redirect_to root_path
    end

    f(:error)
    render :edit
  end

end
