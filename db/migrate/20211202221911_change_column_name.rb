class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :pet_groups, :image, :image_URL
    rename_column :breeds, :image, :image_URL
    rename_column :pets, :image, :image_URL
  end
end
