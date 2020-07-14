class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_logo = true
    @disable_container = true
  end

  def profile
    @user = current_user
    @disable_logo = true
    @trips = @user.trips
    @markers = []

    @trips.each do |trip|
      @markers << markers(trip)
    end
  end

  def write
    @trips = current_user.trips
  end

  private

  def markers(trip)
    trip.steps.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { step: step }),
        id: trip.id,
      }
    end
  end
end
