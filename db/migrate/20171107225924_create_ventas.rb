class CreateVentas < ActiveRecord::Migration[5.1]
  def change
    create_table :ventas do |t|
      t.integer :number
      t.date :date
      t.integer :state
      t.integer :usuario_id
      t.references :formas_pago, foreign_key: true
      t.references :paciente, foreign_key: true

      t.timestamps
    end
  end
end
