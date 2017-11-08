class AddInsumosToSaleDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :sale_details, :insumo_id, :integer
  end
end
