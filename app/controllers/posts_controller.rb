class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params.merge(user_id: session[:user_id]))
    if post.save
      redirect_to action:"index", controller:"welcome"
    else
      error
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
