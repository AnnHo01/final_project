class AddImageToPetGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :pet_groups, :image, :text
  end
end
