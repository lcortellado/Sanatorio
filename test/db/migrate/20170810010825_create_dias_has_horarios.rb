class CreateDiasHasHorarios < ActiveRecord::Migration[5.1]
  def change
    create_table :dias_has_horarios do |t|
      t.references :dia, foreign_key: true
      t.references :horario, foreign_key: true

      t.timestamps
    end
  end
end
