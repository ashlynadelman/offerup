class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :item_id, :integer

  # Direct associations

  has_many   :searches

  has_many   :item_titles,
             resource: ItemResource

  # Indirect associations

  many_to_many :users

end
