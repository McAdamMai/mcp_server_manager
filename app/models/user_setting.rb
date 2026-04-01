class UserSetting < ApplicationRecord
  # The other half of the 1:1 Relationship
  belongs_to :user
end