class AddPriceReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :prices
    add_index :items, :price_id
    change_column_null :items, :price_id, false
  end
end
