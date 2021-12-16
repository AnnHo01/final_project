class AddProvinceRefToCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :prov, :string
    add_reference :customers, :province, foreign_key: true
  end
end
