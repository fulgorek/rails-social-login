class SessionsController < ApplicationController
  # authorized
  before_filter :authorized?, only: [:login_user]

  # login user view
  def login_user
  end

  # admin user view
  def login_admin
  end

  # authorize users by email only
  def auth_user
    params = user_params
    user = User.find_by_email(params[:email])
    if user
      session[:user_id] = user.id
      redirect_to '/connections'
    else
      redirect_to '/login'
    end
  end

  # authorize admin with hardcoded password :)
  def auth_admin
    params = user_params
    user = User.find_by_email(params[:email])
    if user && params[:password] == 'admin'
      session[:user_id]  = user.id
      session[:is_admin] = true
      redirect_to '/connections/list'
    else
      redirect_to '/login/admin'
    end
  end

  # destroy sessions
  def destroy
    session[:user_id]  = nil
    session[:is_admin] = nil
    redirect_to '/'
  end

  private

  # filter stuff
  def user_params
    params.require(:session).permit(:email, :password)
  end
end
