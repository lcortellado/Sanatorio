class CreateInsumos < ActiveRecord::Migration[5.1]
  def change
    create_table :insumos do |t|
      t.string :codigo
      t.string :descripcion
      t.integer :precio_compra
      t.integer :precio_venta
      t.integer :stock
      t.integer :stock_minimo
      t.references :unidades_medida, foreign_key: true
      t.references :proveedore, foreign_key: true
      t.references :tipo_iva, foreign_key: true

      t.timestamps
    end
  end
end
