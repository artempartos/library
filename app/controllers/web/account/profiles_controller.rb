class Web::Account::ProfilesController < Web::Account::ApplicationController
  def edit
    @user = current_user.becomes(::Account::UserProfileEditType)
  end

  def update
    @user = current_user.becomes(::Account::UserProfileEditType)
    if @user.update(params[:user])
      f(:success)
      redirect_to action: :edit
    else
      f(:error)
      render :edit
    end
  end

end
