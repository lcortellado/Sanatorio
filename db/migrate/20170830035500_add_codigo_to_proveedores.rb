class AddCodigoToProveedores < ActiveRecord::Migration[5.1]
  def change
    add_column :proveedores, :codigo, :string
  end
end
