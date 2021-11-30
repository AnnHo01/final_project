class RemovePriceFromBreeds < ActiveRecord::Migration[6.1]
  def change
    remove_column :breeds, :price, :decimal
  end
end
