json.extract! sale_detail, :id, :sale_id, :number, :insumo_id, :qty, :price, :created_at, :updated_at
json.url sale_detail_url(sale_detail, format: :json)
