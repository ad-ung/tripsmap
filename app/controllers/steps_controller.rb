class StepsController < ApplicationController
  def show
    @trip = Trip.find(params[:trip_id])
    @step_id = params[:id].to_i
    @step = @trip.steps[params[:id].to_i - 1]
    @blocks = @step.blocks
  end

  def new
  end

  def create
  end
end
