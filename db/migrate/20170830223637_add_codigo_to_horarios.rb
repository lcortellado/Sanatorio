class AddCodigoToHorarios < ActiveRecord::Migration[5.1]
  def change
    add_column :horarios, :codigo, :string
  end
end
