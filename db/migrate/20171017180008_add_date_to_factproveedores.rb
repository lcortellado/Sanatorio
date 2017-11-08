class AddDateToFactproveedores < ActiveRecord::Migration[5.1]
  def change
    add_column :factproveedores, :date, :date
  end
end
