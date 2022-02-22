class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :item_id, :integer
  attribute :member_since, :date
  attribute :username, :string

  # Direct associations

  has_many   :item_titles,
             resource: ItemResource

  # Indirect associations

  many_to_many :categories

end
