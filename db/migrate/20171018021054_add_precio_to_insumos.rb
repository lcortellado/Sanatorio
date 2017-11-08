class AddPrecioToInsumos < ActiveRecord::Migration[5.1]
  def change
    add_column :insumos, :precio, :decimal
  end
end
