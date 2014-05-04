class CreateTeleporters < ActiveRecord::Migration
  def change
    create_table :teleporters do |t|
      t.string :name
      t.integer :departure_id
      t.integer :destination_id
      t.datetime :departure_date

      t.timestamps
    end
    add_index :teleporters, :departure_id
    add_index :teleporters, :destination_id
  end
end
