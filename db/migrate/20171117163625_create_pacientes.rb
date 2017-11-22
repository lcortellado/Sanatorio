class CreatePacientes < ActiveRecord::Migration[5.1]
  def change
    create_table :pacientes do |t|
      t.string :ci
      t.string :nombre
      t.string :apellido
      t.boolean :sexo
      t.string :direccion
      t.string :telefono
      t.string :celular
      t.date :fecha_naci
      t.string :correo
      t.string :contacto_familiar
      t.string :ciudade

      t.timestamps
    end
  end
end
