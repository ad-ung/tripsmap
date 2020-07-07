class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @steps = @trip.steps.sort_by(&:id_in_its_trip)
    # raise
    @photos = @trip.blocks.where(mediatype: "photos").map { |b| b.files }.flatten
    @contents = @trip.blocks.where(mediatype: "photos")
    #photo.step.title
  end
end
