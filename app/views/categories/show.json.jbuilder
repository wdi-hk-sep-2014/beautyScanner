json.array!(@category.merchants) do |merchant|
  json.extract! merchant, :id, :name, :address, :lat, :lng, :category, :location, :phone, :website, :email
  json.url merchant_url(merchant, format: :json)
end
