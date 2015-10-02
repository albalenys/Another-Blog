class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params.merge(post_id: params[:post_id], user_id: session[:user_id]))
    if comment.save
      redirect_to post_path id:"#{params[:post_id]}", action:"show", controller:"post"
    else
      error
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
