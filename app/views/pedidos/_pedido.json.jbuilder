json.extract! pedido, :id, :codigo, :proveedore_id, :usuario_id, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
