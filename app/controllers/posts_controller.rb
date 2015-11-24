class PostsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @post = Post.new
    render "_new"
  end

  def create
    post = Post.new(post_params.merge(user_id: session[:user_id]))
    if post.save
      redirect_to post_path(post)
    else
      error
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.paginate(:page => params[:page], :per_page => 10)
  end

  def journal
    @posts = Post.where(user: session[:user_id]).paginate(:page => params[:page], :per_page => 20)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
