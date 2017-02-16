class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?


  def current_user
    return nil if session[:session_token].nil?
    @user = User.find_by_session(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token
  end
end
