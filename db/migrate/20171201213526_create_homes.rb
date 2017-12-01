class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :image
      t.integer :asking_price
      t.text :seller_notes
      t.string :location
      t.integer :user_id
      t.datetime :showing_schedule
      t.integer :bedrooms
      t.float :bathrooms
      t.integer :squarefeet
      t.float :acres
      t.string :style
      t.date :year_built

      t.timestamps

    end
  end
end
