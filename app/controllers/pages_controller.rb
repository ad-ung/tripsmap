class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
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
  end
end
