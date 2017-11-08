class CreateBarrios < ActiveRecord::Migration[5.1]
  def change
    create_table :barrios do |t|
      t.string :nombre
      t.references :distrito, foreign_key: true

      t.timestamps
    end
  end
end
