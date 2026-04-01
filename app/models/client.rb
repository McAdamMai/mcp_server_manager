class Client < ApplicationRecord
  # Belongs to the user in a standard 1:N relationship
  belongs_to :user

  validates :name, presence: true
end