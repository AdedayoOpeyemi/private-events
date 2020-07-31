module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def check
    logged_user.present?
  end

  def logged_user
    @logged_user ||= User.find_by(id: session[:user_id])
  end

  def logout
    session.delete :user_id
    @logged_user = nil
  end

  def require_login
    return if check

    flash.alert = 'Please login.'
    redirect_to login_path
  end

  def require_logout
    return unless check

    redirect_to root_path
  end
end
