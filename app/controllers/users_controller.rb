class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to action:"index", controller:"welcome"
    else
      error
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    session.clear
    redirect_to action:"index", controller:"welcome"
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
