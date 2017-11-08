json.extract! insumo, :id, :descripcion, :precio_compra, :precio_venta, :stock, :stock_minimo, :unidades_medida_id, :proveedore_id, :tipo_iva_id, :created_at, :updated_at
json.url insumo_url(insumo, format: :json)
