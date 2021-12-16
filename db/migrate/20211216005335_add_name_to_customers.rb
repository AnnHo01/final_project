class AddNameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :country, :string
    add_column :customers, :prov, :string
    add_column :customers, :city, :string
    add_column :customers, :street, :text
    add_column :customers, :potal_code, :string
  end
end
