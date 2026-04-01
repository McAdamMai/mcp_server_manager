class CreateMcpServers < ActiveRecord::Migration[8.1]
  def change
    create_table :mcp_servers do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
