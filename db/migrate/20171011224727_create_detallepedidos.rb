class CreateDetallepedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :detallepedidos do |t|
      t.integer :solicitado
      t.integer :surtido
      t.references :pedido, foreign_key: true
      t.references :insumo, foreign_key: true

      t.timestamps
    end
  end
end
