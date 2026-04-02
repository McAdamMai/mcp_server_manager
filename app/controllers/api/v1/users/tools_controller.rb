class Api::V1::ToolsController < Api::V1::ApiController
  before_action :authenticate_user!
  before_action :set_mcp_server

  def index
    render json: @mcp_server.tools
  end

  def show
    @tool = @mcp_server.tools.find(params[:id])
    render json: @tool
  end

  private

  def set_mcp_server
    @mcp_server = McpServer.find(params[:mcp_server_id])
  end
end