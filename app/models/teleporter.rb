class Teleporter < ActiveRecord::Base
	
	validates :name, :departure_id, :destination_id, 
			  :departure_date, presence: true
	validates :name, uniqueness: {scope: :departure_date}
	validate  :departure_date_cannot_be_in_the_past

	validate  :refuse_same_departure_and_destination

	belongs_to :departure, class_name: "Departure"
	belongs_to :destination, class_name: "Destination"

	has_many :bookings
	has_many :passengers, through: :bookings

	def refuse_same_departure_and_destination
	    if departure_id.present? && destination_id.present? && destination_id.eql?(departure_id)
	      errors.add(:destination_date, "Departure and Destination Points should not be the same")
	    end
	end

	def departure_date_cannot_be_in_the_past
		if departure_date.present? && departure_date < Time.now.utc
			errors.add(:departure_date, "can't be in the past")
		end
	end

	def busy?
		bookings.size >= 3
	end

	def available?
		bookings.size < 3
	end

end
