class AddCodigosToInsumos < ActiveRecord::Migration[5.1]
  def change
    add_column :insumos, :codigo, :string
    add_column :insumos, :nombre, :string
  end
end
