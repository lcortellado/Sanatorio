class CreateTipoIvas < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_ivas do |t|
      t.string :decripcion

      t.timestamps
    end
  end
end
