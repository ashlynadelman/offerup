class Category < ApplicationRecord
  # Direct associations

  has_many   :searches,
             dependent: :destroy

  has_many   :item_titles,
             class_name: "Item",
             dependent: :destroy

  # Indirect associations

  has_many   :prices,
             through: :item_titles,
             source: :price

  has_many   :users,
             through: :item_titles,
             source: :user

  # Validations

  # Scopes

  def to_s
    item_id
  end
end
