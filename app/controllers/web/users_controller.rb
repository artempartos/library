class Web::UsersController < Web::ApplicationController
  skip_before_action :authenticate_user!

  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new(params[:user])
    @user.generate_confirmation_token
    if @user.save
      @user.create_library
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

  def index
    @users = []
    @users = current_user.companies.first.employees if current_user.companies.any?
    #query = { s: 'created_at desc' }.merge(params[:q] || {})
    #@q = User.active.ransack(query)
    #@users = @q.result.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

end
