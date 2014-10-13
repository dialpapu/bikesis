json.array!(@vendedores) do |vendedore|
  json.extract! vendedore, :id, :idPersona, :documento, :nombrePersona, :apellido, :telefono, :estadoPersona
  json.url vendedore_url(vendedore, format: :json)
end
