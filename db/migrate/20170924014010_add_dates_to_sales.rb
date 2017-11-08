class AddDatesToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :date, :date
  end
end
