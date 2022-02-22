class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_id, :integer
  attribute :price_id, :integer
  attribute :description, :string
  attribute :user_id, :integer
  attribute :location, :string
  attribute :picture, :string
  attribute :posted_date, :date
  attribute :title, :string

  # Direct associations

  # Indirect associations

end
