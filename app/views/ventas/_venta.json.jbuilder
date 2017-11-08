json.extract! venta, :id, :number, :date, :state, :usuario_id, :formas_pago_id, :paciente_id, :created_at, :updated_at
json.url venta_url(venta, format: :json)
