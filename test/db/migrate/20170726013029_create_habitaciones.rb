class CreateHabitaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :habitaciones do |t|
      t.string :descripcion
      t.string :nrohabit

      t.timestamps
    end
  end
end
