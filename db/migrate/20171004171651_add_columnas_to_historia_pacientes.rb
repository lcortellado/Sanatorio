class AddColumnasToHistoriaPacientes < ActiveRecord::Migration[5.1]
  def change
    add_column :historia_pacientes, :estudios, :string
    add_column :historia_pacientes, :resultestudios, :string
    add_column :historia_pacientes, :precio, :integer
    add_column :historia_pacientes, :descuento, :integer
    add_column :historia_pacientes, :total, :integer
  end
end
