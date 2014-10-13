json.array!(@repuesto_accesorios) do |repuesto_accesorio|
  json.extract! repuesto_accesorio, :id, :idProducto, :referenciaProducto, :nombreProducto, :marcaProducto, :imagenProducto, :valorProducto, :estadoProducto, :descripcion, :tipoElemento
  json.url repuesto_accesorio_url(repuesto_accesorio, format: :json)
end
