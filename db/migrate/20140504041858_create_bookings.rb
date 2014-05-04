class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :passenger_id
      t.integer :teleporter_id
      t.integer :departure_id
      t.integer :destination_id

      t.timestamps
    end
 	  add_index :bookings, :passenger_id
    add_index :bookings, :teleporter_id
    add_index :bookings, :departure_id
    add_index :bookings, :destination_id
  end
end
