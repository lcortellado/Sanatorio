class CreateHoras < ActiveRecord::Migration[5.1]
  def change
    create_table :horas do |t|
      t.string :codigo
      t.time :horas

      t.timestamps
    end
  end
end
