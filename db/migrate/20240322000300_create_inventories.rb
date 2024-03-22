class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.text :description
      t.references :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
