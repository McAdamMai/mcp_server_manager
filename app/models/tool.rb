class Tool < ApplicationRecord
  # Belongs to the parent in the 1:N relationship
  belongs_to :mcp_server
  
  validates :name, presence: true
end