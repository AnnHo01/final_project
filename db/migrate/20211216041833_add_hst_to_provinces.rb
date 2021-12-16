class AddHstToProvinces < ActiveRecord::Migration[6.1]
  def change
    add_column :provinces, :hst, :decimal
  end
end
