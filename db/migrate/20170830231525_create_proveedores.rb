class CreateProveedores < ActiveRecord::Migration[5.1]
  def change
    create_table :proveedores do |t|
      t.string :cedula
      t.string :nombre
      t.string :apellido
      t.references :ciudade, foreign_key: true
      t.string :direccion
      t.string :empresa
      t.string :telefono
      t.string :celular
      t.string :correo

      t.timestamps
    end
  end
end
