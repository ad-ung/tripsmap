class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @photos = @trip.blocks.where(mediatype: "photos").map { |b| b.files }.flatten
    @contents = @trip.blocks.where(mediatype: "photos")
    #photo.step.title
  end
end
