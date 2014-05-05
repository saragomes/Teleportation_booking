class BookingsController < ApplicationController
 
  respond_to :html, :json

  def index
    @bookings = Booking.all.includes(:passenger)
    @bookings = @bookings.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end

  def create
    @booking = Booking.new(params[:booking])

    respond_to do |format|
      if @booking.save
        format.html { redirect_to(:bookings, :notice => 'Registration successfull.') }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render "booking/new" }
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
