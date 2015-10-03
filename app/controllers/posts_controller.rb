class PostsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 20)
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
    @post = Post.find(params[:id])
    @comments = @post.comments.paginate(:page => params[:page], :per_page => 10)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
