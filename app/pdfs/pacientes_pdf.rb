class PacientesPdf < Prawn::Document
  def initialize(pacientes)
    super()
    @pacientes = pacientes
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
    table pacientes_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      self.cell_style = {size: 9, border_color: 'd6d8db'}
      self.column_widths = [60, 60, 100, 60, 60, 60, 60]
    end
  end

  def pacientes_rows
    [ [{:content => "Lista de Pacientes", :colspan =>3}],
      [


        'id','Cedula', 'Nombre y Apellido','Ciudad', 'Direccion', 'Telefono', 'Fecha Naciminto'] ] +
      @pacientes.map do |paciente|
      [ paciente.id, paciente.ci, paciente.completo, paciente.ciudade.nombre, paciente.direccion, paciente.telefono, paciente.fecha.strftime("%d/%m/%Y") ]
    end
  end

end
