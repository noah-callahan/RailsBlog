class CommentsController < ApplicationController
    def new

    end

    def create
        @comment = Comment.create(comment_params)
        @comment.save
        redirect_to user_post_path(@comment.user_id, @comment.post_id)
    end

    def destroy
      @comment = Comment.find(params[:id])
      @p = [@comment.user_id, @comment.post_id]
      @comment.destroy
      redirect_to user_post_path(@p[0],@p[1])
    end
end

private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
