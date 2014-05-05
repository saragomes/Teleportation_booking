class Booking < ActiveRecord::Base

	validates :passenger_id, :teleporter_id, presence: true			  
	#validates :passenger_id, uniqueness: {scope: :teleporter_id}	

	belongs_to :passenger
	belongs_to :teleporter

	def self.already_reserved_by_passenger?(email, teleporter_id)
		Booking.includes("passenger")
			   .where(teleporter_id: "#{teleporter_id}", 
			   		  passengers: { email: "#{email}" }).exists?
	end

end
