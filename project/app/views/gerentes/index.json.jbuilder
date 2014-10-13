json.array!(@gerentes) do |gerente|
  json.extract! gerente, :id, :idPersona, :documento, :nombrePersona, :apellido, :telefono, :estadoPersona
  json.url gerente_url(gerente, format: :json)
end
