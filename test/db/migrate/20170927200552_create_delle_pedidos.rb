class CreateDellePedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :delle_pedidos do |t|
      t.references :pedido, foreign_key: true
      t.references :insumo, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
