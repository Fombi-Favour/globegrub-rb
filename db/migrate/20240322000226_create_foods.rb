class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measure_unit
      t.decimal :price

      t.timestamps
    end
  end
end
