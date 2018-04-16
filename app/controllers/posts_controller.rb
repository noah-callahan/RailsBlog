class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @id = current_user.id
  end

  def create
    Post.create(post_params)
    redirect_to user_path(current_user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(update_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

  private

  def update_params
    params.require(:post).permit(:title, :content)
  end


  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
  
end
