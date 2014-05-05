require 'spec_helper'

describe Booking do
    
	it { should validate_presence_of :passenger_id }
	it { should validate_presence_of :teleporter_id }
	it { should validate_uniqueness_of(:passenger_id).scoped_to(:teleporter_id) }

  	it { should belong_to :passenger }
  	it { should belong_to :teleporter }


  describe "already_reserved_by_passenger?" do
    before do
      @passenger   = FactoryGirl.create(:passenger)
      @teleporter = FactoryGirl.create(:teleporter)
    end

    context "when it's already reserved by the passenger" do
      it "should return true" do
      	@booking = FactoryGirl.create(:booking, teleporter: @teleporter, passenger: @passenger)
        result = Booking.already_reserved_by_passenger?(@passenger.email, @teleporter.id)
        result.should === true
      end
    end

    context "when it's not reserved by the passenger" do
      it "should return false" do
        result = Booking.already_reserved_by_passenger?(@passenger.email, @teleporter.id)
        result.should === false
      end
    end

  end


end
