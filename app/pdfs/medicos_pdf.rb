class MedicosPdf < Prawn::Document
  def initialize(medicos)
    super()
    @medicos = medicos
    header
    body
  end

  def header
    image "#{Rails.root}/app/assets/images/logo.png", width: 540, height: 75, :at => [0, 740]
    draw_text "REPORTES SANASYS WEB", :at => [185,660]
  end

  def body
    move_down 90
    table_content
  end

  def table_content
    table medicos_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      self.cell_style = {size: 9, border_color: 'd6d8db'}
      self.column_widths = [150, 150, 150, 150]
    end
  end

  def medicos_rows
    [ [{:content => "Lista de Profesionales Médicos con que Contamos", :colspan =>3}],
      [


         'Nombre y Apellido','Especialidad','Ciudad'] ] +
      @medicos.map do |medico|
      [  medico.completo, medico.especialidade.descripcion, medico.ciudade.nombre]
    end
  end

end
