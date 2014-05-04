class Booking < ActiveRecord::Base

	validates :passenger_id, :teleporter_id, presence: true			  
	validates :passenger_id, uniqueness: {scope: :teleporter_id}	

	belongs_to :passenger
	belongs_to :teleporter

end
