class WelcomeController < ApplicationController
  before_filter :authorize, except: [:index]

  def index
    @posts = Post.all
  end
end
