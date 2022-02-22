class PriceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false

  # Direct associations

  has_many   :searches

  has_many   :item_titles,
             resource: ItemResource

  # Indirect associations

  many_to_many :categories

  many_to_many :users

end
