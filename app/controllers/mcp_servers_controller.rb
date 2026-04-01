class McpServersController < ApplicationController
  def index
    # Grab all the global servers from the database
    @mcp_servers = McpServer.all
    
    # Grab the current user's connections so we can check their status in the view
    @user_connections = current_user.connections
  end

  def show
    @mcp_server = McpServer.find(params[:id])
  end
end