json.array!(@sellers) do |seller|
  json.extract! seller, :id, :personId, :document, :personName, :lastName, :telephone, :personStatus
  json.url seller_url(seller, format: :json)
end
