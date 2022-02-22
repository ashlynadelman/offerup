json.extract! item, :id, :category_id, :price_id, :description, :user_id, :location, :picture, :posted_date, :title, :created_at, :updated_at
json.url item_url(item, format: :json)
