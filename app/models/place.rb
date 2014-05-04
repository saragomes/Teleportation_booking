class Place < ActiveRecord::Base	
	validates :name, presence: true
	validates :name, uniqueness: {scope: :type}
	has_many :bookings
end