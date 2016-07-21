class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper modules for authorizing
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :admin?
  helper_method :authorize!
  helper_method :authorize_admin_only!

  private

  # current user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # check if user is logged in
  def user_signed_in?
    return true if current_user
  end

  # check if logged in user is admin?
  def admin?
    return true if session[:is_admin]
  end

  # redirect to login
  def authorize!
    redirect_to '/login' unless current_user
  end

  # check if authorized
  def authorized?
    redirect_to '/connections' if current_user
  end

  # only admins stuff
  def authorize_admin_only!
    redirect_to '/login' unless admin?
  end
end
