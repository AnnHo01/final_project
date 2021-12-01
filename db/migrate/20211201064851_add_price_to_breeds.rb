class AddPriceToBreeds < ActiveRecord::Migration[6.1]
  def change
    add_column :breeds, :price, :decimal
  end
end
