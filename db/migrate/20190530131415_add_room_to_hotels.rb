class AddRoomToHotels < ActiveRecord::Migration[5.2]
  def change
      add_column :hotels, :total_room_number, :integer
  end
end
