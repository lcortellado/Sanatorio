class CreateCitas < ActiveRecord::Migration[5.1]
  def change
    create_table :citas do |t|
      t.string :asunto
      t.references :paciente, foreign_key: true
      t.references :medico, foreign_key: true
      t.string :nro_orden
      t.date :fecha
      t.string :nota
      t.references :estado, foreign_key: true
      t.string :estadoPago
      t.integer :costo

      t.timestamps
    end
  end
end
