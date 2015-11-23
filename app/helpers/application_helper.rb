module ApplicationHelper
  def logged_in?
    session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

  def timestamp(obj)
    obj.created_at.strftime("%b %d %Y")
  end
end
