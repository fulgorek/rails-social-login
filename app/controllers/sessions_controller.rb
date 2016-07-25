class SessionsController < ApplicationController
  # authorized
  before_filter :authorized?, only: [:login_user]
  before_action :set_session, only: [:login_user, :login_admin]

  # login user view
  def login
  end

  # admin user view
  def login_admin
  end

  # authorize users by email only
  def auth
    params = user_params
    type = params[:password].nil? ? 'user' : 'admin'
    @session = Session.new(params)
    if @session.valid?
      send("auth_#{type}", params)
    else
      render "login_#{type}".to_sym
    end
  end

  # destroy sessions
  def destroy
    session[:user_id]  = nil
    session[:is_admin] = nil
    redirect_to '/'
  end

  private

  def set_session
    @session = Session.new
  end

  def auth_user(params)
    user = User.find_by_email(params[:email])
    session[:tmp] = user
    if user
      session[:user_id] = user.id
      redirect_to '/connections'
    else
      render :login_user
    end
  end

  def auth_admin(params)
    user = User.find_by(email: params[:email], admin: true)
    if user && params[:password] == 'admin'
      session[:user_id]  = user.id
      session[:is_admin] = true
      redirect_to '/connections/list'
    else
      render :login_admin
    end
  end

  # filter stuff
  def user_params
    params.require(:session).permit(:email, :password)
  end
end
