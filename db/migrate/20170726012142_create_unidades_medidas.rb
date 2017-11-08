class CreateUnidadesMedidas < ActiveRecord::Migration[5.1]
  def change
    create_table :unidades_medidas do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
