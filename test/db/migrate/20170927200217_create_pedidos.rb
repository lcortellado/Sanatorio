class CreatePedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :pedidos do |t|
      t.integer :codigo
      t.date :fecha
      t.references :proveedore, foreign_key: true

      t.timestamps
    end
  end
end
