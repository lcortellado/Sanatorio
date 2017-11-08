json.extract! reserva, :id, :asunto, :paciente_id, :medico_id, :fecha, :hora, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
