class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    return nil if session_token.nil?
    @current_user ||= find_by_sesssion_token(session[:session_token])
  end

  def logged_in?
    !@current_user.nil?
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end