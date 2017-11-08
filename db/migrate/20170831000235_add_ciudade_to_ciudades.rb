class AddCiudadeToCiudades < ActiveRecord::Migration[5.1]
  def change
    add_reference :ciudades, :ciudade, foreign_key: true
  end
end
