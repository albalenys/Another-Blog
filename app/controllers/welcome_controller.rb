class WelcomeController < ApplicationController
  before_filter :authorize, except: [:index]

  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 20)
  end
end
