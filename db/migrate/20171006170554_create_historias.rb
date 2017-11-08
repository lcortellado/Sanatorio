class CreateHistorias < ActiveRecord::Migration[5.1]
  def change
    create_table :historias do |t|
      t.string :codigo
      t.string :diagnostico
      t.string :indicaciones
      t.date :fecha_proxima_cita
      t.string :recomendaciones
      t.references :reserva, foreign_key: true
      t.string :estudios
      t.string :resultestudios
      t.integer :precio
      t.integer :descuento
      t.integer :total

      t.timestamps
    end
  end
end
