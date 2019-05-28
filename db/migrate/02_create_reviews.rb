class CreateReviews < ActiveRecord::Migration[4.2]

  def change
    create_table :reviews do |t|
      t.string :content
      t.string :star_rating
      t.integer :user_id
      t.integer :hotel_id
    end
  end
end
