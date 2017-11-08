json.extract! pedido, :id, :codigo, :fecha, :proveedore_id, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
