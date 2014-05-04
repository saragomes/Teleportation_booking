require 'spec_helper'

describe Teleporter do
  
	it { should validate_presence_of :name }
  it { should validate_presence_of :departure_id }
  it { should validate_presence_of :destination_id }
  it { should validate_presence_of :departure_date }
  it { should validate_uniqueness_of(:name).scoped_to(:departure_date) }

  it { should belong_to :departure }
  it { should belong_to :destination }
  it { should have_many :bookings }
  it { should have_many :passengers }

  describe "Departure date_cannot be in the past" do
    let(:teleporter) { FactoryGirl.build :teleporter }
    subject { teleporter }

    context "when departure_date is before the current time" do
      it {should_not allow_value(1.day.ago).
          for(:departure_date)}
    end

    context "when the departure_date is after the start_date" do
      it {should allow_value(teleporter.departure_date + 1.day).
          for(:departure_date)}
    end
  end


  describe "Busy?" do
    before do
      @teleporter1 = FactoryGirl.create(:teleporter)
      @teleporter2 = FactoryGirl.create(:teleporter)
      @booking1 = FactoryGirl.create(:booking, teleporter: @teleporter1)
      @booking2 = FactoryGirl.create(:booking, teleporter: @teleporter2)
      @booking3 = FactoryGirl.create(:booking, teleporter: @teleporter1)
    end

    context "when is not busy - 3th reservations" do
      it "should return false" do
        @teleporter1.busy?.should === false
      end
    end

    context "when is not busy - 3th reservations" do
      before do
        @booking4 = FactoryGirl.create(:booking, teleporter: @teleporter1)
      end
      it "should return false" do
        @teleporter1.busy?.should === true
      end
    end
  end


  describe "Available?" do
    before do
      @teleporter1 = FactoryGirl.create(:teleporter)
      @teleporter2 = FactoryGirl.create(:teleporter)
      @booking1 = FactoryGirl.create(:booking, teleporter: @teleporter1)
      @booking2 = FactoryGirl.create(:booking, teleporter: @teleporter2)
      @booking3 = FactoryGirl.create(:booking, teleporter: @teleporter1)
    end

    context "when is available - 2th reservations" do
      it "should return false" do
        @teleporter1.available?.should === true
      end
    end

    context "when is not available - 3th reservations" do
      before do
        @booking4 = FactoryGirl.create(:booking, teleporter: @teleporter1)
      end
      it "should return false" do
        @teleporter1.available?.should === false
      end
    end
  end

end
