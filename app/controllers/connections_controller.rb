class ConnectionsController < ApplicationController
  # connections and omniauth requires user logged in
  before_filter :authorize!, only: [:connections, :omniauth]

  # list require an admin
  before_filter :authorize_admin_only!, only: [:list]

  # omniauth callback
  def omniauth
    render json: request.env['omniauth.auth']
  end

  # admin list of all users
  def list
    @users = User.all
  end

  # view for connections
  def connections
  end

  private

  # save method for the connection
  def save_connection(type, url, data)
  end

  # cure facebook data
  def facebook_data
  end

  # cure twitter data
  def twitter_data
  end

  # cure linkedin data
  def linkedin_data
  end
end
