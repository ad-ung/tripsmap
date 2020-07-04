class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @steps = @trip.steps.sort_by(&:id_in_its_trip)
  end
end
