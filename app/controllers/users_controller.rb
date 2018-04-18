class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to '/login'
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def name
    
  end

  def destroy
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
    @posts.each(& :destroy)
    @user.destroy
    @current_user = nil
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:uname, :fname, :lname, :email, :password)
  end

end

