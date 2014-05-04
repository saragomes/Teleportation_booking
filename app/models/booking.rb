class Booking < ActiveRecord::Base

	validates :passenger_id, :teleporter_id, :departure_id,
			  		:destination_id, presence: true			  
	validates :passenger_id, uniqueness: {scope: :teleporter_id}
	validate  :refuse_same_departure_and_destination

	belongs_to :passenger
	belongs_to :teleporter
	belongs_to :departure, class_name: "Departure"
	belongs_to :destination, class_name: "Destination"

	def refuse_same_departure_and_destination
	    if departure_id.present? && destination_id.present? && destination_id.eql?(departure_id)
	      errors.add(:destination_date, "Departure and Destination Points should not be the same")
	    end
	end

end
