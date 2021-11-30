class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.text :image
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
