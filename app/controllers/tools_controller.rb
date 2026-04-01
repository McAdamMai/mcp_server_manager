class ToolsController < ApplicationController
  # Run this method before every action in this controller
  before_action :set_mcp_server

  def index
    # Only grab the tools that belong to THIS specific server
    @tools = @mcp_server.tools
  end

  def show
    @tool = @mcp_server.tools.find(params[:id])
  end

  private

  # This is the secret to nested controllers: always find the parent first!
  def set_mcp_server
    @mcp_server = McpServer.find(params[:mcp_server_id])
  end
end