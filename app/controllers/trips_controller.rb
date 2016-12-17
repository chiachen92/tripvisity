class TripsController < ApplicationController
  TRIPS_PER_PAGE = 5
  before_action :authenticate_user, except: [:index, :show]


  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new trip_params
    @trip.user_id = session[:user_id]
    # @trip.user = current_user
    if @trip.save
      flash[:success] = "Trip was successfully  created"
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    find_params
    @comment = Comment.new
  end

  def index
    if params[:search]
      @trips = Trip.search(params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: TRIPS_PER_PAGE)
    else
      @trips = Trip.order(created_at: :desc).paginate(page: params[:page], per_page: TRIPS_PER_PAGE)
    end
  end

  def edit
    find_params
  end

  def update
    find_params
    if @trip.update trip_params
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end


  def destroy
    find_params
    @trip.destroy
    redirect_to trips_path
  end

  def search_trip
    redirect_to trips_path
  end

  private

  def find_params
    @trip = Trip.find params[:id]
  end

  def trip_params
    params.require(:trip).permit(:destination, :start_date, :end_date, :user_id)
  end


end
