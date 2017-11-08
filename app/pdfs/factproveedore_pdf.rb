class FactproveedorePdf < Prawn::Document
  def initialize(factproveedore)
    super()
    @factproveedore = factproveedore
    @codigo_factproveedore = @factproveedore.codigo.to_s
    header
    body
   
  end

  def header
    image "#{Rails.root}/app/assets/images/logo-header.png", width: 540, height: 75, :at => [0, 740]
    draw_text "SANASYS RUC. : 7665566-9", :at => [185,660]
  end

  def body
    move_down 90
    table_content
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
      self.column_widths = [60, 60, 100,  40, 40,40, 40, 40]
    end
  end

  def insumos_rows
    [ [{:content => "Cliente", :colspan =>3}, {:content => "Factura Número", :colspan => 3}],
      [{:content => @factproveedore.sanatorio.nombre, :colspan => 3}, {:content => @codigo_factproveedore, :colspan => 3}],
      [{:content => "Nombre", :colspan =>3}, {:content => "Fecha", :colspan => 3}],
      [{:content => @factproveedore.sanatorio.nombre, :colspan => 3}, {:content => @factproveedore.created_at.strftime("%d/%m/%Y"), :colspan => 3}],
      [{:content => "Detalle Factura", :colspan => 5}],
      ['Código', 'Cantidad', 'Descripción', 'Precio', '5%', 'Exenta', '10%', 'Total'] ] +
      @factproveedore.detallefactproveedores.map do |detalles_fact|
      [detalles_fact.insumo.codigo, detalles_fact.cantidad, detalles_fact.insumo.descripcion,  detalles_fact.precio.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse]
    end
  end
end
