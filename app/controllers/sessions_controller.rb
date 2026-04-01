class SessionsController < ApplicationController
  # Skip the login requirement so users can actually access the login page
  skip_before_action :require_login, only: [:new, :create]

  def new
    # Renders the login form (app/views/sessions/new.html.erb)
  end

  def create
    # 1. Find the user by the email they typed in
    user = User.find_by(email: params[:email])

    # 2. Check if the user exists AND the password matches
    if user && user.authenticate(params[:password])
      # 3. Store the user's ID in the browser's session cookie
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_to mcp_servers_path
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Log the user out by deleting their ID from the session
    session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to login_path
  end
end