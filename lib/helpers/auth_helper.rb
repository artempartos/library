module AuthHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    current_user
  end

  def signed_as_admin?
    signed_in? && current_user.admin?
  end

  def authenticate_user!
    unless signed_in?
      redirect_to new_session_path(from: "#{request.protocol}#{request.host_with_port}#{request.fullpath}")
    end
  end

  def authenticate_admin!
    unless signed_as_admin?
      redirect_to new_session_path(from: "#{request.protocol}#{request.host_with_port}#{request.fullpath}")
    end
  end

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end
end
