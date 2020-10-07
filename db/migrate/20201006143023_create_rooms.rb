class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_no
      t.integer :room_category_id

      t.timestamps
    end
  end
end
