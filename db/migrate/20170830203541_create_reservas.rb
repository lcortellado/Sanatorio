class CreateReservas < ActiveRecord::Migration[5.1]
  def change
    create_table :reservas do |t|
      t.string :asunto
      t.references :paciente, foreign_key: true
      t.references :medico, foreign_key: true
      t.date :fecha
      t.time :hora

      t.timestamps
    end
  end
end
