class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.datetime :checkin
      t.datetime :checkout

      t.timestamps
    end
  end
end
