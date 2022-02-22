class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :category_id
      t.integer :price_id
      t.text :description
      t.integer :user_id
      t.string :location
      t.string :picture
      t.date :posted_date
      t.string :title

      t.timestamps
    end
  end
end
