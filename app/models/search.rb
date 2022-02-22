class Search < ApplicationRecord
  # Direct associations

  belongs_to :item,
             :required => false

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    item.to_s
  end

end
