class CreateHotels < ActiveRecord::Migration[4.2]

  def change
    create_table :hotels do |t|
      t.string :location
      t.integer :price
    end
  end
end
