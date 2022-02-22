class AddPriceReferenceToSearches < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :searches, :prices
    add_index :searches, :price_id
  end
end
