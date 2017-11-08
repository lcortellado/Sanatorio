class CreateInternaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :internaciones do |t|
      t.date :fechaIng
      t.time :horaIng
      t.date :fechaSalida
      t.time :horaSalida
      t.references :habitacione, foreign_key: true
      t.references :paciente, foreign_key: true
      t.references :medico, foreign_key: true
      t.integer :totalGasto

      t.timestamps
    end
  end
end
