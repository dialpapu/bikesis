json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :idPersona, :documento, :nombrePersona, :apellido, :telefono, :estadoPersona, :fechaNacimiento, :permisoPublicidad
  json.url cliente_url(cliente, format: :json)
end
