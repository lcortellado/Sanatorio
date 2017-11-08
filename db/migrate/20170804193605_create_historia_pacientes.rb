class CreateHistoriaPacientes < ActiveRecord::Migration[5.1]
  def change
    create_table :historia_pacientes do |t|
      t.string :diagnostico
      t.string :indicaciones
      t.date :fecha_proxima_cita
      t.string :recomendaciones
      t.references :consult, foreign_key: true

      t.timestamps
    end
  end
end
