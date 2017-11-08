class CreateCompras < ActiveRecord::Migration[5.1]
  def change
    create_table :compras do |t|
      t.integer :number
      t.date :date
      t.integer :state
      t.references :usuario, foreign_key: true
      t.references :formas_pago, foreign_key: true
      t.references :proveedore, foreign_key: true

      t.timestamps
    end
  end
end
