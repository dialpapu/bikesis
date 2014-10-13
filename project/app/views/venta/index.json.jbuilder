json.array!(@venta) do |ventum|
  json.extract! ventum, :id, :idVenta, :idVendedor, :idCliente, :fechaVenta, :estadoVenta, :observaciones
  json.url ventum_url(ventum, format: :json)
end
