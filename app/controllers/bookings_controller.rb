class BookingsController < ApplicationController

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
      teleporter_id = params[:teleporter_id]
      result = Booking.already_reserved_by_passenger?(params[:email], teleporter_id)
      
      passenger = Passenger.create(first_name: params[:first_name],
                             last_name: params[:last_name], 
                             email: params[:email])
      
      @booking = Booking.new(passenger:     passenger,
                             teleporter_id: teleporter_id)

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

private
  def initialize
    @bookings = Booking.all.includes(:passenger, :teleporter)
  end

end
