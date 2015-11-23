class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      error
    end
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.posts.limit(3).order(created_at: :desc)
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid input: must include both title and content."
      redirect_to edit_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :city, :state, :bio)
  end
end
