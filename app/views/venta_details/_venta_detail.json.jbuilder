json.extract! venta_detail, :id, :number, :qty, :price, :venta_id, :insumo_id, :created_at, :updated_at
json.url venta_detail_url(venta_detail, format: :json)
