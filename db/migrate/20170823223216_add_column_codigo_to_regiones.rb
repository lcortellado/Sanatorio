class AddColumnCodigoToRegiones < ActiveRecord::Migration[5.1]
  def change
    add_column :regiones, :codigo, :string
  end
end
