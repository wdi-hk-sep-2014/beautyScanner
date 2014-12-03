json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :category, :name, :location, :phone, :website, :email, :address
  json.url merchant_url(merchant, format: :json)
end
