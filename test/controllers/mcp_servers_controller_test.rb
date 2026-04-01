require "test_helper"

class McpServersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mcp_servers_index_url
    assert_response :success
  end

  test "should get show" do
    get mcp_servers_show_url
    assert_response :success
  end
end
