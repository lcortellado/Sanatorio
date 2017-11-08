class AddTotalToFactproveedores < ActiveRecord::Migration[5.1]
  def change
    add_column :factproveedores, :total, :decimal
  end
end
