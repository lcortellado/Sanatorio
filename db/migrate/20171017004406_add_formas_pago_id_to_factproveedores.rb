class AddFormasPagoIdToFactproveedores < ActiveRecord::Migration[5.1]
  def change
    add_reference :factproveedores, :formas_pago, foreign_key: true
  end
end
