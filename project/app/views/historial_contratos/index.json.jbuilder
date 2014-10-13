json.array!(@historial_contratos) do |historial_contrato|
  json.extract! historial_contrato, :id, :idPersona, :fechaContrato, :fechaFinContrato
  json.url historial_contrato_url(historial_contrato, format: :json)
end
