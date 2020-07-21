class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @steps = @trip.steps.sort_by(&:id_in_its_trip)
    @photos = @trip.blocks.where(mediatype: "photos").map { |b| b.files }.flatten
    @contents = @trip.blocks.where(mediatype: "photos")
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.save
    redirect_to new_trip_step_path(@trip)
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :starts_on, :ends_on, :cover_picture)
  end
end
