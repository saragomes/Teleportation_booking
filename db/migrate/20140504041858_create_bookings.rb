class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :passenger_id
      t.integer :teleporter_id

      t.timestamps
    end
 	  add_index :bookings, :passenger_id
    add_index :bookings, :teleporter_id
  end
end
