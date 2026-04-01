class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    # Check if the :user key actually exists in params
    if params[:user].present?
      if @user.update(user_params)
        redirect_to settings_path, notice: "Profile updated successfully!"
      else
        render :edit, status: :unprocessable_entity
      end
    else
      # If they just clicked save without a photo, just send them back to the dashboard
      redirect_to mcp_servers_path, notice: "No changes were made."
    end
  end

  private

  # This explicitly allows the 'avatar' file to pass through the form
  def user_params
    params.require(:user).permit(:avatar)
  end
end