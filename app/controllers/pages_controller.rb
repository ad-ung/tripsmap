class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_logo = true
    @disable_container = true
  end

  def profile
    @disable_logo = true
  end

  def write
    @trips = Trip.all
  end
end
