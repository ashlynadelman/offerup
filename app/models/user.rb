class User < ApplicationRecord
  # Direct associations

  has_many   :item_titles,
             :class_name => "Item",
             :dependent => :destroy

  # Indirect associations

  has_many   :prices,
             :through => :item_titles,
             :source => :price

  has_many   :categories,
             :through => :item_titles,
             :source => :category

  # Validations

  # Scopes

  def to_s
    item_id
  end

end
