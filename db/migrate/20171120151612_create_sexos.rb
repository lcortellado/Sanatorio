class CreateSexos < ActiveRecord::Migration[5.1]
  def change
    create_table :sexos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
