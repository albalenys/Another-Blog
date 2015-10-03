class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    end
  end
end