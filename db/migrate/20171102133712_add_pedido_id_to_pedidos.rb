class AddPedidoIdToPedidos < ActiveRecord::Migration[5.1]
  def change
    add_reference :pedidos, :pedido, foreign_key: true
  end
end
