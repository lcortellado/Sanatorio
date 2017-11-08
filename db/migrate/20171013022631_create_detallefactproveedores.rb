class CreateDetallefactproveedores < ActiveRecord::Migration[5.1]
  def change
    create_table :detallefactproveedores do |t|
      t.references :factproveedores, foreign_key: true
      t.integer :number
      t.references :insumo, foreign_key: true
      t.integer :cantidad
      t.decimal :precio

      t.timestamps
    end
  end
end
