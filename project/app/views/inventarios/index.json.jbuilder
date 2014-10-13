json.array!(@inventarios) do |inventario|
  json.extract! inventario, :id, :cantidadProductos, :idProducto
  json.url inventario_url(inventario, format: :json)
end
