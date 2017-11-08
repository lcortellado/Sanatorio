class CreateCompraDatails < ActiveRecord::Migration[5.1]
  def change
    create_table :compra_datails do |t|
      t.integer :number
      t.references :insumo, foreign_key: true
      t.integer :qty
      t.decimal :price
      t.references :compra, foreign_key: true

      t.timestamps
    end
  end
end
