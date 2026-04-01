# Clear existing data so you don't get duplicates if you run it twice
puts "Cleaning database..."
User.destroy_all
McpServer.destroy_all

puts "Creating Test Accounts..."
# We create 3 distinct test users as required
user1 = User.create!(email: "admin@test.com", password: "password123", password_confirmation: "password123")
user2 = User.create!(email: "grader@mcmaster.ca", password: "password123", password_confirmation: "password123")
user3 = User.create!(email: "student@test.com", password: "password123", password_confirmation: "password123")

puts "Creating Global MCP Servers..."
# Recreating the exact rows from your mockup image
servers = [
  McpServer.create!(name: "Notion", description: "Read and write Notion pages"),
  McpServer.create!(name: "ChatGPT MCP", description: "OpenAI integration"),
  McpServer.create!(name: "Stripe", description: "Payment processing tools"),
  McpServer.create!(name: "Brave Search", description: "Web search capabilities"),
  McpServer.create!(name: "GitHub", description: "Repo and PR management")
]

puts "Creating AI Clients for User 1..."
# Recreating the columns from your mockup image
client1 = user1.clients.create!(name: "Claude")
client2 = user1.clients.create!(name: "Cursor")

puts "Adding standard tools to ALL servers..."

# The tools you requested
standard_tools = [
  { name: "shell", description: "Execute command-line operations" },
  { name: "read", description: "Read files and retrieve data" },
  { name: "write", description: "Write files and modify data" },
  { name: "database", description: "Query and manage database records" }
]

# Loop through every server and create the 4 tools for it
McpServer.all.each do |server|
  standard_tools.each do |tool_data|
    Tool.create!(
      name: tool_data[:name],
      description: "#{tool_data[:description]} via #{server.name}",
      mcp_server: server
    )
  end
end

puts "----------------------------------------"
puts "Seeding Complete!"
puts "Test Accounts Details (Include these in your submission!):"
puts "Email: admin@test.com | Password: password123"
puts "Email: grader@mcmaster.ca | Password: password123"
puts "Email: student@test.com | Password: password123"
puts "----------------------------------------"