class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.integer :number
      t.date :date
      t.integer :state
      t.integer :usuario_id

      t.timestamps
    end
  end
end
