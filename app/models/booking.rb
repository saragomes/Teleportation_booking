class Booking < ActiveRecord::Base

	validates :passenger_id, :teleporter_id, :departure_point,
			  		:destination_point, presence: true			  
	validates :passenger_id, uniqueness: true

	belongs_to :passenger
	belongs_to :teleporter
	belongs_to :departure_point, class_name: "Place"
	belongs_to :destination_point, class_name: "Place"

end
