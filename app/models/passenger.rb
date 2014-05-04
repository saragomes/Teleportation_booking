class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Passenger < ActiveRecord::Base

	validates :first_name, :last_name, presence: true
	validates :first_name, uniqueness: {scope: :last_name}
	validates :email, uniqueness:true, presence: true, email: true

	has_one :booking
	has_one :teleporter, through: :booking

end
