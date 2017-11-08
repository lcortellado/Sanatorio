class CreateCiudades < ActiveRecord::Migration[5.1]
  def change
    create_table :ciudades do |t|
      t.string :nombre
      t.references :departamento, foreign_key: true

      t.timestamps
    end
  end
end
