json.array!(@equipaciones) do |equipacione|
  json.extract! equipacione, :id, :idProducto, :referenciaProducto, :nombreProducto, :marcaProducto, :imagenProducto, :valorProducto, :estadoProducto, :descripcion, :talla, :genero
  json.url equipacione_url(equipacione, format: :json)
end
