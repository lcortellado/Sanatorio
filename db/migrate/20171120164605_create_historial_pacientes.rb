class CreateHistorialPacientes < ActiveRecord::Migration[5.1]
  def change
    create_table :historial_pacientes do |t|
      t.string :codigo
      t.string :diagnostico
      t.string :indicaciones
      t.references :reserva, foreign_key: true
      t.string :estudios
      t.string :resultestudios
      t.date :fecha_proxima_cita
      t.string :recomendaciones
      t.integer :precio
      t.integer :descuento
      t.integer :total

      t.timestamps
    end
  end
end
