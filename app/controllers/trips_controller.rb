class TripsController < ApplicationController
  def index
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
