class CreateDetalleInternaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :detalle_internaciones do |t|
      t.string :descripcion
      t.string :cantidad
      t.integer :preciouni
      t.integer :subtotal
      t.date :fecha
      t.time :hora
      t.references :internacione, foreign_key: true

      t.timestamps
    end
  end
end
