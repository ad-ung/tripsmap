class StepsController < ApplicationController
  def index
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @step_id = params[:id].to_i
    @step = @trip.steps[params[:id].to_i - 1]
    @blocks = @step.blocks
  end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.trip = Trip.find(params[:trip_id])
    @step.save
  end

  def update
    @step = Step.find(params[:id])
    if @step.update(step_params)
      render json: { success: true }
    else
      render json: { success: false, errors: step.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def step_params
    params.require(:step).permit(:title, :location, :nb_of_days, :id_in_its_trip)
  end
end
