class AddNrosToReservas < ActiveRecord::Migration[5.1]
  def change
    add_column :reservas, :nro, :integer
  end
end
