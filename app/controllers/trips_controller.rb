class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @steps = @trip.steps
  end
end
