class AddUsuarioToPacientes < ActiveRecord::Migration[5.1]
  def change
    add_reference :pacientes, :usuario, foreign_key: true
  end
end
