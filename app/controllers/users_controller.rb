class UsersController < ApplicationController
  # common filters to access resources
  before_filter :authorize!, only: [:index]
  before_filter :authorized?, only: [:index, :new]
  before_filter :authorize_admin_only!, only: [:show, :edit, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # save user in db
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        redirect_to '/'
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # only accessible by admin
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
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
