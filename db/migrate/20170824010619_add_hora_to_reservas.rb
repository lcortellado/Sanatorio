class AddHoraToReservas < ActiveRecord::Migration[5.1]
  def change
    add_column :reservas, :hora_id, :integer
  end
end
