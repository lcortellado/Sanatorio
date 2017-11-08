class AddCodigoToReservas < ActiveRecord::Migration[5.1]
  def change
    add_column :reservas, :codigo, :string
  end
end
