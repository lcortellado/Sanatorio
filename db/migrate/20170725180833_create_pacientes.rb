class CreatePacientes < ActiveRecord::Migration[5.1]
  def change
    create_table :pacientes do |t|
      t.string :ci
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.string :telefono
      t.string :celular
      t.string :fecha_naci
      t.string :correo
      t.string :contacto_familiar

      t.timestamps
    end
  end
end
