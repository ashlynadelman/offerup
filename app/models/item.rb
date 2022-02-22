class Item < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :category

  belongs_to :price

  has_many   :searches,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category.to_s
  end

end
