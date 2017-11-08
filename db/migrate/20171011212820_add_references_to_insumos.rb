class AddReferencesToInsumos < ActiveRecord::Migration[5.1]
  def change
    add_reference :insumos, :proveedore, foreign_key: true
    add_reference :insumos, :unidades_medida, foreign_key: true
    add_reference :insumos, :tipo_iva, foreign_key: true
  end
end
