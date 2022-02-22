class Item < ApplicationRecord
  # Direct associations

  has_many   :searches,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category.to_s
  end

end
