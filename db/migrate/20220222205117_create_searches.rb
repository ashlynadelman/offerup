class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.integer :item_id
      t.integer :price_id
      t.integer :category_id

      t.timestamps
    end
  end
end
