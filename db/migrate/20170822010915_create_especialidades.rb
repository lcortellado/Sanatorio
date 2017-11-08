class CreateEspecialidades < ActiveRecord::Migration[5.1]
  def change
    create_table :especialidades do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
