json.extract! compra_datail, :id, :number, :insumo_id, :qty, :price, :compra_id, :created_at, :updated_at
json.url compra_datail_url(compra_datail, format: :json)
