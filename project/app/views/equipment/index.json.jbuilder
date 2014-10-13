json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :productId, :productReference, :productName, :productTradeMark, :productImage, :productPrice, :productStatus, :productDescription, :size, :gender
  json.url equipment_url(equipment, format: :json)
end
