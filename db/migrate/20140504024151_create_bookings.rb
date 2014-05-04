class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :passenger_id
      t.integer :teleporter_id
      t.integer :departure_point
      t.integer :destination_point

      t.timestamps
    end
  end
end
