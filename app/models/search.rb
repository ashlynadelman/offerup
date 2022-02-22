class Search < ApplicationRecord
  # Direct associations

  belongs_to :category,
             optional: true

  belongs_to :price,
             optional: true

  belongs_to :item,
             optional: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    item.to_s
  end
end
