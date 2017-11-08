class InsumosPdf < Prawn::Document
  def initialize(insumos)
    super()
    @insumos = insumos
    header
    body
  end

  def header
    image "#{Rails.root}/app/assets/images/logo-header.png", width: 540, height: 75, :at => [0, 740]
    draw_text "REPORTES SANASYS WEB", :at => [185,660]
  end

  def body
    move_down 90
    table_content
  end

  def table_content
    table insumos_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      self.cell_style = {size: 9, border_color: 'd6d8db'}
      self.column_widths = [50, 90, 60, 60, 40, 60, 60, 60, 40]
    end
  end

  def insumos_rows
    [ [{:content => "Lista de Insumos", :colspan =>3}],
      [


        'Codigo', 'descripcion','precio Compra', 'precio Venta', 'Stock', 'Stock Minimo', 'Proveedor', 'Unidad Medida', 'Iva'] ] +
      @insumos.map do |insumo|
      [ insumo.codigo, insumo.descripcion, insumo.precio_compra, insumo.precio_venta, insumo.stock, insumo.stock_minimo, insumo.proveedore.nombre, insumo.unidades_medida.descripcion, insumo.tipo_iva.decripcion ]
    end
  end

end
