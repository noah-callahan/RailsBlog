class CommentsController < ApplicationController
    def new

    end

    def create
        Comment.create(comment_params)
        redirect_to '/'
    end
end

private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
