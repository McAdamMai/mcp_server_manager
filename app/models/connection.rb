class Connection < ApplicationRecord
  # A connection acts as the bridge. It belongs to one user and one server.
  belongs_to :user
  belongs_to :mcp_server

  # Optional: You can add validations here to ensure a user 
  # doesn't connect to the exact same server twice
  validates :mcp_server_id, uniqueness: { scope: :user_id, message: "is already connected" }
end