class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :item_id, :integer
  attribute :member_since, :date
  attribute :username, :string

  # Direct associations

  # Indirect associations

end
