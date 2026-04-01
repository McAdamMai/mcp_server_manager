class CreateTools < ActiveRecord::Migration[8.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.references :mcp_server, null: false, foreign_key: true

      t.timestamps
    end
  end
end
