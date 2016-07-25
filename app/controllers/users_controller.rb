class UsersController < ApplicationController
  # common filters to access resources
  before_filter :authorized?, only: [:new]
  before_action :new_user, only: [:new]

  # GET /users/new
  def new
  end

  # POST /users
  # save user in db
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/connections'
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def new_user
    @user = User.new
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email)
  end

  # make random password
  def make_password
    Array.new(10) { [*'A'..'Z', *'a'..'z', *'0'..'9'].sample }.join
  end
end
