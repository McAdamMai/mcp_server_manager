class McpServer < ApplicationRecord
  # 1:N Relationship (A server has many specific tools)
  has_many :tools, dependent: :destroy

  # The other side of the Rich Many-to-Many relationship
  has_many :connections, dependent: :destroy
  has_many :users, through: :connections
end