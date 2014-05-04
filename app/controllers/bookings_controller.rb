class BookingsController < ApplicationController
 
  respond_to :html, :json

  def index
  	#TODO:: Includes Performance
    @bookings = Booking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end

  def new
  	@booking = Booking.new
  end

  def find
  end

  def create
    @booking = Booking.new(params[:booking])

    respond_to do |format|
      if @booking.save
        format.html { redirect_to(:bookings, :notice => 'Registration successfull.') }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render "booking_sessions/new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

end
