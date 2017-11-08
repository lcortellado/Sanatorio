class AddFechaToMedicos < ActiveRecord::Migration[5.1]
  def change
    add_column :medicos, :fecha, :date
    add_reference :medicos, :ciudade, foreign_key: true
  end
end
