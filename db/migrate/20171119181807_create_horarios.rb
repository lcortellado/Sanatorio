class CreateHorarios < ActiveRecord::Migration[5.1]
  def change
    create_table :horarios do |t|
      t.string :codigo
      t.references :medico, foreign_key: true
      t.references :dia, foreign_key: true
      t.time :horadesde
      t.time :horahasta
      t.date :fecha

      t.timestamps
    end
  end
end
