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
    @follower = Follower.find_by(user: @user, follower_pseudo: current_user.pseudo)
    @followers = @user.followers || 0
    @markers = []
    @count_steps = 0

    @trips.each do |trip|
      @markers << markers(trip)
      trip.steps.each do |step|
        @count_steps += 1
      end
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
