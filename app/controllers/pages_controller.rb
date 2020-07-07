class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_logo = true
    @disable_container = true
  end

  def profile
    @disable_logo = true
    @steps = current_user.steps
    @markers = @steps.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude
      }
    end
  end

  def write
    @trips = Trip.all
  end
end
