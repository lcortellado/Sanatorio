class SalePdf < Prawn::Document
  def initialize(sale)
    super()
    @sale = sale
    @number_sale = @sale.number.to_s
    header
    body
   
  end

  def header
    image "#{Rails.root}/app/assets/images/logo-header.png", width: 540, height: 75, :at => [0, 740]
    draw_text "SanaSys Web", :at => [185,660]
  end

  def body
    move_down 90
    table_content
  end

  

  def table_content
    table sales_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      row(2).font_style = :bold
      row(2).background_color = 'dbdee2'
      row(4).font_style = :bold
      row(4).background_color = 'dbdee2'
      self.header = true
      self.cell_style = {size: 10, border_color: 'd6d8db'}
      self.column_widths = [60, 60, 100,  90, 90]

    end
  end


  def sales_rows
    [ [{:content => "Titular", :colspan =>4}, {:content => "Número Factura", :colspan => 4}],
      [{:content => @sale.paciente.completo, :colspan => 4}, {:content => @number_sale, :colspan => 4}],
      [{:content => "Condicion de Venta", :colspan =>4}, {:content => "Fecha", :colspan => 4}],
      [{:content => @sale.formas_pago.descripcion, :colspan => 4}, {:content => @sale.date.strftime("%d/%m/%Y"), :colspan => 4}],
      [{:content => "Detalles Articulos ", :colspan => 5}],
      ['Código', 'Cantidad', 'Descripcion','Precio Unit', 'Subtotal'] ] +
     @sale.sale_details.map do |detail|
      [detail.number, detail.qty, detail.insumo.descripcion, detail.price, detail.subtotal ]
   
    end
                  @sales.map do |sale|
                   [sale.total]
                    end
 end
 
end
