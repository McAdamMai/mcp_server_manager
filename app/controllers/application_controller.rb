class ApplicationController < ActionController::Base
  # Make the current_user method available in your Views as well
  helper_method :current_user, :logged_in?

  # Force users to log in before they can see anything
  before_action :require_login

  def current_user
    # Find the user in the database if their ID is stored in the session
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path # We will define this route later
    end
  end
end