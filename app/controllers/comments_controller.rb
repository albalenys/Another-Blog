class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params.merge(user_id: session[:user_id]))
    if comment.save
      redirect_to post_path
    else
      error
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
