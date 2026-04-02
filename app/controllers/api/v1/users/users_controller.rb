class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticate_user!

  def update
    if current_user.update(user_params)
      render json: { message: "Profile updated successfully!", user: current_user }, status: :ok
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end