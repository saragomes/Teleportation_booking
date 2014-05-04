class CreateTeleporters < ActiveRecord::Migration
  def change
    create_table :teleporters do |t|
      t.string :name
      t.datetime :departure_date

      t.timestamps
    end
  end
end
