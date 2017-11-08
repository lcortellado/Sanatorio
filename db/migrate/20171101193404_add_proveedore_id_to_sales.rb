class AddProveedoreIdToSales < ActiveRecord::Migration[5.1]
  def change
    add_reference :sales, :proveedore, foreign_key: true
  end
end
