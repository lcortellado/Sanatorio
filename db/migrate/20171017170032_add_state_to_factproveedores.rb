class AddStateToFactproveedores < ActiveRecord::Migration[5.1]
  def change
    add_column :factproveedores, :state, :integer
  end
end
