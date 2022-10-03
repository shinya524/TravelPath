class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|

      t.integer :post_id,    null: false
      t.integer :genre_id,   null: false
      t.integer :prefecture, null: false
      t.string :name,        null: false
      t.string :address,     null: false
      t.string :postcode,    null: false
      t.float :latirude,     null: false
      t.float :longitude,    null: false


      t.timestamps
    end
  end
end
