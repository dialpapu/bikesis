json.array!(@items) do |item|
  json.extract! item, :id, :idVenta, :idProducto, :cantidadItem
  json.url item_url(item, format: :json)
end
