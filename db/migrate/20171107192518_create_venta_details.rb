class CreateVentaDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :venta_details do |t|
      t.integer :number
      t.integer :qty
      t.integer :price
      t.integer :venta_id
      t.integer :insumo_id

      t.timestamps
    end
  end
end
