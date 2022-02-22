class Price < ApplicationRecord
  # Direct associations

  has_many   :searches,
             dependent: :destroy

  has_many   :item_titles,
             class_name: "Item",
             dependent: :destroy

  # Indirect associations

  has_many   :categories,
             through: :item_titles,
             source: :category

  has_many   :users,
             through: :item_titles,
             source: :user

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
