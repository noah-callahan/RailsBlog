class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to '/'
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    
  end

  def name
    
  end

  private

  def user_params
    params.require(:user).permit(:uname, :fname, :lname, :email, :password)
  end

end

