class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def authorize
    redirect_to new_user_path unless logged_in?
  end
end
