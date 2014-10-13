json.array!(@bicicletas) do |bicicleta|
  json.extract! bicicleta, :id, :idProducto, :referenciaProducto, :nombreProducto, :marcaProducto, :imagenProducto, :valorProducto, :estadoProducto, :descripcion, :medidas, :tipoBicicleta
  json.url bicicleta_url(bicicleta, format: :json)
end
