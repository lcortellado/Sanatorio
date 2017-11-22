json.extract! historial_paciente, :id, :codigo, :diagnostico, :indicaciones, :reserva_id, :estudios, :resultestudios, :fecha_proxima_cita, :recomendaciones, :precio, :descuento, :total, :created_at, :updated_at
json.url historial_paciente_url(historial_paciente, format: :json)
