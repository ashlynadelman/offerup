json.extract! user, :id, :item_id, :member_since, :username, :created_at,
              :updated_at
json.url user_url(user, format: :json)
