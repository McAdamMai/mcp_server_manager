# app/controllers/api/v1/mcp_servers_controller.rb

module Api
  module V1
    class McpServersController < ActionController::API
      before_action :authenticate_user!

      # Requirement: GET request responding with a collection of data
      def index
        @mcp_servers = McpServer.all
        render json: @mcp_servers
      end

      # Requirement: GET request for retrieving details of a single element
      def show
        @mcp_server = McpServer.find(params[:id])
        render json: @mcp_server.as_json(include: :tools)
      end
    end
  end
end