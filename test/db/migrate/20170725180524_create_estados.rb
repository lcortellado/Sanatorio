class CreateEstados < ActiveRecord::Migration[5.1]
  def change
    create_table :estados do |t|
      t.string :decripcion

      t.timestamps
    end
  end
end
