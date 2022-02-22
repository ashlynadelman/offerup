class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :item_id
      t.date :member_since
      t.string :username

      t.timestamps
    end
  end
end
