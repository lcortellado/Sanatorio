class AddFormapagoIdToSales < ActiveRecord::Migration[5.1]
  def change
    add_reference :sales, :formas_pago, foreign_key: true
  end
end
