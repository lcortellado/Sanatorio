class AddDescuentoToSaleDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :sale_details, :descuento, :decimal
  end
end
