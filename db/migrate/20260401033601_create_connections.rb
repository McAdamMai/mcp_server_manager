class CreateConnections < ActiveRecord::Migration[8.1]
  def change
    create_table :connections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mcp_server, null: false, foreign_key: true
      t.string :encrypted_api_key
      t.boolean :is_active

      t.timestamps
    end
  end
end
