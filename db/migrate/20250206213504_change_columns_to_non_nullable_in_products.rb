class ChangeColumnsToNonNullableInProducts < ActiveRecord::Migration[8.0]
  def change
    change_column_null :products, :name, false
    change_column_null :products, :stock, false
    change_column_null :products, :price, false
  end
end
