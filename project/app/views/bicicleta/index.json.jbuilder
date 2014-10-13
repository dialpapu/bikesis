json.array!(@bicicleta) do |bicicletum|
  json.extract! bicicletum, :id, :idProducto, :referenciaProducto, :nombreProducto, :marcaProducto, :imagenProducto, :valorProducto, :estadoProducto, :descripcion, :medidas, :tipoBicicleta
  json.url bicicletum_url(bicicletum, format: :json)
end
