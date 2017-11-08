class CreateFormasPagos < ActiveRecord::Migration[5.1]
  def change
    create_table :formas_pagos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
