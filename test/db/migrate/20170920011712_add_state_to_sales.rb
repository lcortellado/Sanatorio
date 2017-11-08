class AddStateToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :state, :integer
  end
end
