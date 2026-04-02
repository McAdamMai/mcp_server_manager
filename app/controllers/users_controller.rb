class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    
    if params[:user].present?
      if @user.update(user_params)
        redirect_to settings_path, notice: "Profile updated successfully!"
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to mcp_servers_path, notice: "No changes were made."
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end