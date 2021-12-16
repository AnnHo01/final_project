class CreateBreedOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :breed_orders do |t|
      t.decimal :price
      t.integer :quantity
      t.references :order, null: false, foreign_key: true
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
