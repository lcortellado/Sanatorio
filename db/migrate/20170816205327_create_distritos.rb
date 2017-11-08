class CreateDistritos < ActiveRecord::Migration[5.1]
  def change
    create_table :distritos do |t|
      t.string :nombre
      t.references :departamento, foreign_key: true

      t.timestamps
    end
  end
end
