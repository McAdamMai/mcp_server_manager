class McpServersController < ApplicationController
  before_action :authenticate_user!

  def index
    @mcp_servers = McpServer.all
    @user_connections = current_user.connections
  end

  def show
    @mcp_server = McpServer.find(params[:id])
  end
end