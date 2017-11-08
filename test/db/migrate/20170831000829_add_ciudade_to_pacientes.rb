class AddCiudadeToPacientes < ActiveRecord::Migration[5.1]
  def change
    add_reference :pacientes, :ciudade, foreign_key: true
  end
end
