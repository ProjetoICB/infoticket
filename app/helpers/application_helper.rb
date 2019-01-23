module ApplicationHelper
  def yes_or_no?(value)
    value ? "Yes" : "No"
  end

  def session_user
    @session_user ||= User.find(:first, :conditions => ['id = ?', session[:user]])
  end
end










