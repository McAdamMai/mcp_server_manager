class User < ApplicationRecord
  # Phase 1 Authentication requirement
  has_secure_password

  # 1:N Relationship (A user can have many AI clients like Claude or Cursor)
  has_many :clients, dependent: :destroy
  
  # 1:N Relationship to the join table
  has_many :connections, dependent: :destroy
  
  # Rich Many-to-Many (has-through)
  # This allows you to type `user.mcp_servers` to see all servers they installed
  has_many :mcp_servers, through: :connections

  # 1:1 Relationship (Bonus to guarantee you hit 3 relationship types!)
  # You would generate a UserSetting model to hold theme preferences, etc.
  has_one :user_setting, dependent: :destroy

  has_one_attached :avatar
end