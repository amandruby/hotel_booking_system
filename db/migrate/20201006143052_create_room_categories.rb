class CreateRoomCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :room_categories do |t|
      t.string :name
      t.text :detail
      t.integer :price

      t.timestamps
    end
  end
end
