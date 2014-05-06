class BookingsController < ApplicationController

  layout 'application'
  
  before_filter :initialize, only: [:index, :new]
  respond_to :html, :json

  def index
    @bookings = @bookings.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end

  def new
    @teleporter = Teleporter.find(params[:teleporter_id])
    @booking = Booking.new(teleporter: @teleporter)
    @bookings = @bookings.paginate(:per_page => 20, :page => params[:page])
  end

  def create
    @teleporter = Teleporter.find(params[:teleporter_id])
    @passenger = Passenger.find_or_create_by(email: params[:email], 
                                             first_name: params[:first_name],
                                             last_name: params[:last_name])


    @booking = Booking.new(passenger:     @passenger,
                           teleporter_id: @teleporter.id) 

    respond_to do |format|
      if @booking.save
        format.html { redirect_to(:bookings, :notice => 'Registration successfull.') }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { redirect_to(controller: :bookings, action: :new, teleporter_id: 3)}
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

private
  def initialize
    @bookings = Booking.all.includes(:passenger, :teleporter)
  end

end
