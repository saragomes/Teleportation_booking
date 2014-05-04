require 'spec_helper'

describe Booking do
    
	it { should validate_presence_of :passenger_id }
	it { should validate_presence_of :teleporter_id }
	it { should validate_uniqueness_of(:passenger_id).scoped_to(:teleporter_id) }

  	it { should belong_to :passenger }
  	it { should belong_to :teleporter }

end
