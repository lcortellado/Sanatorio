class CreateSanatorios < ActiveRecord::Migration[5.1]
  def change
    create_table :sanatorios do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono1
      t.string :telefono2
      t.string :telefon3
      t.string :pagina
      t.string :photo

      t.timestamps
    end
  end
end
