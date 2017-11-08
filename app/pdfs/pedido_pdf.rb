class PedidoPdf < Prawn::Document
  def initialize(pedido)
    super()
    @pedido = pedido
    @codigo_pedido = @pedido.codigo.to_s
    header
    body
    footer
  end

  def header
    image "#{Rails.root}/app/assets/images/logo-header.png", width: 540, height: 75, :at => [0, 740]
    draw_text "Pedidos Proveedores", :at => [185,660]
  end

  def body
    move_down 90
    table_content
  end

  def footer
    draw_text @pedido.usuario.name + " " + @pedido.usuario.email, :at => [25, 28]
    draw_text "_________________________________", :at => [10, 25]
    draw_text "Elaboró y Autorizó", :at => [32, 12]

    draw_text @pedido.proveedore.nombre, :at => [350, 28]
    draw_text "_________________________________", :at => [310, 25]
    draw_text "Firma del Responsable", :at => [370, 12]
  end

  def table_content
    table insumos_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      row(2).font_style = :bold
      row(2).background_color = 'dbdee2'
      row(4).font_style = :bold
      row(4).background_color = 'dbdee2'
      self.header = true
      self.cell_style = {size: 10, border_color: 'd6d8db'}
      self.column_widths = [60, 100, 90, 100, 100]
    end
  end

  def insumos_rows
    [ [{:content => "Titular", :colspan =>3}, {:content => "Número de Orden", :colspan => 3}],
      [{:content => @pedido.proveedore.nombre, :colspan => 3}, {:content => @codigo_pedido, :colspan => 3}],
      [{:content => "Proveedore", :colspan =>3}, {:content => "Fecha", :colspan => 3}],
      [{:content => @pedido.proveedore.nombre, :colspan => 3}, {:content => @pedido.created_at.strftime("%d/%m/%Y"), :colspan => 3}],
      [{:content => "Articulos Solicitados", :colspan => 5}],
      ['Código', 'Descripción', 'Precio Compra','Solicitado', 'Observacion'] ] +
      @pedido.detallepedidos.map do |detalles_pedido|
      [detalles_pedido.insumo.codigo, detalles_pedido.insumo.descripcion, detalles_pedido.insumo.precio_compra, detalles_pedido.solicitado.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse, detalles_pedido.surtido.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse]
    end
  end
end
