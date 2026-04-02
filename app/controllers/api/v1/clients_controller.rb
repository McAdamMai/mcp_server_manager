# app/controllers/api/v1/clients_controller.rb
module Api
  module V1
    class ClientsController < ActionController::API
      before_action :authenticate_user!

      # Scenario: List All Clients (Collection GET)
      def index
        @clients = current_user.clients
        render json: @clients
      end

      # Scenario: Get Client Details (Details GET)
      def show
        @client = current_user.clients.find_by(id: params[:id])
        
        if @client
          render json: @client
        else
          render json: { error: "Client not found" }, status: :not_found
        end
      end

      # Scenario: Delete Client (Bonus DELETE)
      def destroy
        @client = current_user.clients.find_by(id: params[:id])
        if @client
          @client.destroy
          render json: { message: "Client deleted" }, status: :ok
        else
          render json: { error: "Client not found" }, status: :not_found
        end
      end
    end
  end
end