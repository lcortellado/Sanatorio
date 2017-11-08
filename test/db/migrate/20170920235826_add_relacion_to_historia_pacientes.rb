class AddRelacionToHistoriaPacientes < ActiveRecord::Migration[5.1]
  def change
    add_reference :historia_pacientes, :reserva, foreign_key: true
  end
end
