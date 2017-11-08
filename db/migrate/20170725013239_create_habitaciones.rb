class CreateHabitaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :habitaciones do |t|
      t.string :descripcion
      t.string :nroHabitacion

      t.timestamps
    end
  end
end
