class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @disable_logo = true
    @trips = @user.trips
    @markers = []
    @count_steps = 0

    @trips.each do |trip|
      @markers << markers(trip)
      trip.steps.each do |step|
        @count_steps += 1
      end
    end
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
