class MedicosPdf < Prawn::Document
  def initialize(medicos)
    super()
    @medicos = medicos
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
    table medicos_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      self.cell_style = {size: 9, border_color: 'd6d8db'}
      self.column_widths = [20, 60, 100, 70, 60, 60, 60, 60]
    end
  end

  def medicos_rows
    [ [{:content => "Lista de Doctores", :colspan =>3}],
      [


        'id','Cedula', 'Nombre y Apellido','Especialidad','Ciudad', 'Direccion', 'Telefono', 'Fecha Naciminto'] ] +
      @medicos.map do |medico|
      [ medico.id, medico.ci, medico.completo, medico.especialidade.descripcion, medico.ciudade.nombre, medico.direccion, medico.telefono, medico.fecha.strftime("%d/%m/%Y")]
    end
  end

end
