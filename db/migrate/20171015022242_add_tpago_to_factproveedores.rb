class AddTpagoToFactproveedores < ActiveRecord::Migration[5.1]
  def change
    add_column :factproveedores, :tpago, :boolean, default: false
  end
end
