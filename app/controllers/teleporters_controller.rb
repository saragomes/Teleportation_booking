class TeleportersController < ApplicationController
 
  helper_method :sort_column, :sort_direction
  respond_to :html, :json
  before_filter :search, :only => [:index, :create, :destroy]

  def index
    @teleporters = Teleporter.all.includes(:departure, :destination, :bookings)
    @teleporters = @teleporters.paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teleporters }
    end
  end

  def find
    @teleporter = Teleporter.new
  end

  def search
  	@teleporters = Teleporter.all.where(departure_id:   params[:book][:departure])
                                 .where(destination_id: params[:book][:destination])
                                 .order(:departure_date)
                                 .includes(:departure, :destination, :bookings)
                                 #.where(departure_date: params[:start] - params[:end])
    @teleporters = @teleporters.paginate(:per_page => 20, :page => params[:page])
#
    respond_to do |format|
      format.html { render action: :index }
      format.json { render json: @teleporters }
    end
  end

  def create
    @teleporter = Teleporter.new(params[:teleporter])

    respond_to do |format|
      if @teleporter.save
        format.html { redirect_to(:teleporters, :notice => 'Registration successfull.') }
        format.json { render json: @teleporter, status: :created, location: @teleporter }
      else
        format.html { render "teleporter_sessions/new" }
        format.json { render json: @teleporter.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @teleporter = Teleporter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teleporter }
    end
  end

private
  def search_by_name
    @teleporters = Teleporters.order("#{sort_column} #{sort_direction}")
    @teleporters = @teleporters.where("name like ? ", "%#{params[:search]}%") unless params[:search].blank?
  end

  
  def sort_column
    Teleporters.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
