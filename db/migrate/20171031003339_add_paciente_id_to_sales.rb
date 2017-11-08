class AddPacienteIdToSales < ActiveRecord::Migration[5.1]
  def change
    add_reference :sales, :paciente, foreign_key: true
  end
end
