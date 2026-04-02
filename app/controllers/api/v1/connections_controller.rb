# app/controllers/api/v1/connections_controller.rb
module Api
  module V1
    class ConnectionsController < ActionController::API
      before_action :authenticate_user!

      # Requirement Bonus: POST request [cite: 15]
      def create
        # Using .find_by instead of .find prevents the "RecordNotFound" crash
        @server = McpServer.find_by(id: params[:mcp_server_id])

        if @server
          connection = current_user.connections.find_or_create_by(mcp_server: @server)
          connection.is_active = true 
          connection.save
          render json: { 
            message: "Connected to #{@server.name}", 
            connection: connection 
          }, status: :created
      else
        # This returns a clean JSON error instead of crashing the server
        render json: { error: "Server with ID #{params[:mcp_server_id]} not found" }, status: :not_found
      end
    end

      # Requirement Bonus: DELETE request [cite: 16]
      def destroy
        # For DELETE, use the server ID from the URL: /api/v1/connections/:id
        connection = current_user.connections.find_by(mcp_server_id: params[:id])
        
        if connection&.destroy
          render json: { message: "Successfully disconnected" }, status: :ok
        else
          render json: { error: "Connection not found" }, status: :not_found
        end
      end
    end
  end
end