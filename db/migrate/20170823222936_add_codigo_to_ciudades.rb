class AddCodigoToCiudades < ActiveRecord::Migration[5.1]
  def change
    add_column :ciudades, :codigo, :string
  end
end
