class CreateInventoryFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_foods do |t|
      t.decimal :quantity
      t.references :inventory, foreign_key: { to_table: :inventories }
      t.references :food, foreign_key: { to_table: :foods }

      t.timestamps
    end
  end
end
