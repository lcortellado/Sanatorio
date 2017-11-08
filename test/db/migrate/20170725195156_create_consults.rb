class CreateConsults < ActiveRecord::Migration[5.1]
  def change
    create_table :consults do |t|
      t.references :turno, foreign_key: true
      t.references :tipo_consult, foreign_key: true

      t.timestamps
    end
  end
end
