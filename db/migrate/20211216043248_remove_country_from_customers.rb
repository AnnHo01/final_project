class RemoveCountryFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :country, :string
  end
end
