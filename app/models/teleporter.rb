class Teleporter < ActiveRecord::Base
	
	validates :name, :departure_date, presence: true
	validates :name, uniqueness: {scope: :departure_date}
	validate  :departure_date_cannot_be_in_the_past

	has_many :bookings
	has_many :passengers, through: :bookings

	def departure_date_cannot_be_in_the_past
		if departure_date.present? && departure_date < Date.today
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
