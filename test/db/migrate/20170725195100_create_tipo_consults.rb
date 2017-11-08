class CreateTipoConsults < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_consults do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
