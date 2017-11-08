class AddObservaconToDetallepedidos < ActiveRecord::Migration[5.1]
  def change
    add_column :detallepedidos, :observaciones, :string
  end
end
