json.array!(@products) do |product|
  json.extract! product, :id, :name, :artist, :description
  json.url product_url(product, format: :json)
end
