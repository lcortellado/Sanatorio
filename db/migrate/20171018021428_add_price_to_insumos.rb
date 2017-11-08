class AddPriceToInsumos < ActiveRecord::Migration[5.1]
  def change
    add_column :insumos, :price, :decimal
  end
end
