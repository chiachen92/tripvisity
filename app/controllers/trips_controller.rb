class TripsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new trip_params
    if @trip.save
      flash[:success] = "Trip was successfully  created"
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find params[:id]
  end

  def index
    @trips = Trip.order(created_at: :desc)
  end

  def edit
    @trip = Trip.find params[:id]
  end

  def update
    @trip = Trip.find params[:id]
    if @trip.update trip_params
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end


  def destroy
    @trip = Trip.find params[:id]
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :start_date, :end_date)
  end

end
