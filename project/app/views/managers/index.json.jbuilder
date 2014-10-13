json.array!(@managers) do |manager|
  json.extract! manager, :id, :personId, :document, :personName, :lastName, :telephone, :personStatus
  json.url manager_url(manager, format: :json)
end
