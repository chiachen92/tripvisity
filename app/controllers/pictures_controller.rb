class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @trip = Trip.find params[:trip_id]
    @picture = Picture.new
  end

  def create
    @trip = Trip.find params[:trip_id]
    @picture = Picture.new picture_params
    if @picture.save
      flash[:notice] = "Thanks for adding a new picture!"
      redirect_to trip_path(@picture.trip)
    else
      render new_trip_path
    end
  end

  def show
    @picture = Picture.find params[:id]
  end

  def edit
    @picture = Picture.find params[:id]
  end

  def update
    @picture = Picture.find params[:id]
    if @picture.update picture_params
      flash[:notice] = 'Picture Updated'
      redirect_to trip_picture_path(@picture)
    else
      flash[:notice] = 'Failed to Update'
      redirect_to trip_path(@trip)
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "Picture Deleted"
    redirect_to trip_path
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :caption, :trip_id)
  end

end
