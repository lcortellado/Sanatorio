class CreateTurnoDia < ActiveRecord::Migration[5.1]
  def change
    create_table :turno_dia do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
