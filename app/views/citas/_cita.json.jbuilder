json.extract! cita, :id, :asunto, :paciente_id, :medico_id, :nro_orden, :fecha, :nota, :estado_id, :estadoPago, :costo, :created_at, :updated_at
json.url cita_url(cita, format: :json)
