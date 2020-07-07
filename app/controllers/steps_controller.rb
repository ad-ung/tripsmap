class StepsController < ApplicationController
  def index
  end

  def show
    @step = Step.find(params[:id])
    @trip = @step.trip
    @step_id = @step.id_in_its_trip
    @blocks = @step.blocks
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @step = Step.new
    @step.blocks.build
    @step.blocks.build
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @step = Step.new(step_params)
    @step.trip = @trip
    @step.id_in_its_trip = @trip.steps.count + 1
    raise
    @step.save
  end

  def update
    @step = Step.find(params[:id])
    if @step.update(step_params)
      render json: @step, status: 200
    else
      render json: { success: false, errors: step.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def step_params
    params.require(:step).permit(:title, :location, :nb_of_days, :id_in_its_trip, blocks_attributes: [
      :text, :mediatype, files: []
    ])
  end
end
