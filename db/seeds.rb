# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

# Create 20 Departures, Destination and Teleporters
for d in 0..20
	Departure.create!(name: "Departure_Point_#{d}")
	Destination.create!(name: "Destination_Point_#{d}")
	
	# Create a Teleporter hour by hour
	for h in 1..24
		departure_date = (Time.now + d.day) + h.hour
		Teleporter.create!(name: 			"Teleporter_#{departure_date}",
	      				   departure_id: 	Departure.last,
	      				   destination_id:  Destination.last,
	      				   departure_date:  departure_date)
	end
end