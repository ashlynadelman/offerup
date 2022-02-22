class SearchResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :item_id, :integer
  attribute :price_id, :integer
  attribute :category_id, :integer

  # Direct associations

  belongs_to :item

  # Indirect associations

end
