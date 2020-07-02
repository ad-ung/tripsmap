class StepsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.trip = Trip.find(params[:trip_id])
    @step.save
  end

  private

  def step_params
    params.require(:step).permit(:title, :location, :nb_of_days)
  end

end
