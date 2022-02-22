class AddItemReferenceToSearches < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :searches, :items
    add_index :searches, :item_id
  end
end
