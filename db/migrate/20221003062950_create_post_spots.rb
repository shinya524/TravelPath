class CreatePostSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :post_spots do |t|

      t.integer :user_id,       null: false
      t.integer :prefecture_id, null: false
      t.integer :genre_id,      null: false
      t.string :name,           null: false
      t.string :address,        null: false
      t.string :postcode,       null: false
      t.float :latitude,        null: false
      t.float :longitude,       null: false
      t.text :introduction,     null: false
      t.string :comment,        null: false

      t.timestamps
    end
  end
end
