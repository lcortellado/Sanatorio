class CreateSaleDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_details do |t|
      t.integer :sale_id
      t.integer :number
      t.integer :item_id
      t.integer :qty
      t.decimal :price

      t.timestamps
    end
  end
end
