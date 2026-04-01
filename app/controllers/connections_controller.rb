class ConnectionsController < ApplicationController
  def create
    @server = McpServer.find(params[:mcp_server_id])
    
    # find_or_create_by prevents the user from accidentally connecting twice!
    current_user.connections.find_or_create_by(mcp_server: @server)
    
    # Redirect back to the dashboard with a success flash message
    redirect_to mcp_servers_path, notice: "Successfully connected to #{@server.name}!"
  end

  def destroy
    @server = McpServer.find(params[:mcp_server_id])
    
    # Find the specific connection and delete it
    connection = current_user.connections.find_by(mcp_server: @server)
    connection.destroy if connection
    
    # Redirect back to the dashboard
    redirect_to mcp_servers_path, alert: "Disconnected from #{@server.name}."
  end
end