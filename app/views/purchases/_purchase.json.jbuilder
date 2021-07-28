json.extract! purchase, :id, :user_id, :iten_id, :price, :count, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
