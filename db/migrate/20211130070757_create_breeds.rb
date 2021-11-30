class CreateBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :breeds do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.text :image
      t.integer :qty
      t.references :pet_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
