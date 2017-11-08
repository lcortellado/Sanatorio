json.extract! historia, :id, :codigo, :diagnostico, :indicaciones, :fecha_proxima_cita, :recomendaciones, :reserva_id, :estudios, :resultestudios, :precio, :descuento, :total, :created_at, :updated_at
json.url historia_url(historia, format: :json)
