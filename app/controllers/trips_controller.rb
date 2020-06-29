class TripsController < ApplicationController
  def index
  end

  def show
    @trip = Trip.find(params[:trip_id])
  end
end
