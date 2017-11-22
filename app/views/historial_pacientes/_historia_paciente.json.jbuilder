json.extract! historia_paciente, :id, :diagnostico, :indicaciones, :fecha_proxima_cita, :recomendaciones, :consult_id, :created_at, :updated_at
json.url historia_paciente_url(historia_paciente, format: :json)
