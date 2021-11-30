class CreatePetGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_groups do |t|
      t.string :name
      t.integer :total_pets

      t.timestamps
    end
  end
end
