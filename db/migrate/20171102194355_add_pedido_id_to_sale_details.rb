class AddPedidoIdToSaleDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :sale_details, :pedido, foreign_key: true
  end
end
