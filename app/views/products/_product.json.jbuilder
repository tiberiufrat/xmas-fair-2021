json.extract! product, :id, :name, :price, :stand_id, :created_at, :updated_at
json.url product_url(product, format: :json)
