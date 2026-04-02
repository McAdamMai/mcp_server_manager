class ConnectionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @server = McpServer.find_by(id: params[:mcp_server_id])

    if @server
      connection = current_user.connections.find_or_initialize_by(mcp_server: @server)
      connection.is_active = true
    
      if connection.save
        # TRIGGER THE EMAIL HERE
        # deliver_later sends it in the background so the API stays fast!
        NotificationMailer.with(user: current_user, server: @server).server_connected_email.deliver_later
      
        render json: { message: "Connected to #{@server.name}" }, status: :created
      end
    end
  end