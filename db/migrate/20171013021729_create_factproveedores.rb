class CreateFactproveedores < ActiveRecord::Migration[5.1]
  def change
    create_table :factproveedores do |t|
      t.integer :codigo
      t.references :usuario, foreign_key: true
      t.references :sanatorio, foreign_key: true
      t.references :pedido, foreign_key: true

      t.timestamps
    end
  end
end
