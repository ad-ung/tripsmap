class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
  end

  def write
    @trips = Trip.all
    # @trip = Trip.find(params[:trip_id])
  end
end
