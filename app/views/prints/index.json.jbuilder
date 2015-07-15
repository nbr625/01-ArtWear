json.array!(@prints) do |print|
  json.extract! print, :id, :name, :description, :pledge, :rating, :category
  json.url print_url(print, format: :json)
end
