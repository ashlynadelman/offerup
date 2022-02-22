class Price < ApplicationRecord
  # Direct associations

  has_many   :item_titles,
             :class_name => "Item",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
