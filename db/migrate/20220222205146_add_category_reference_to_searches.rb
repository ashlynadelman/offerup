class AddCategoryReferenceToSearches < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :searches, :categories
    add_index :searches, :category_id
  end
end
