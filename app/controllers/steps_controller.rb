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

  def explore
    @blocks = Block.where(mediatype: 'photos')
    # if params[:search]
    #   @steps = Step.search_by_location_and_title(params[:search])
    #   @blocks = @steps.blocks
    #end
  end

  private

  def step_params
    params.require(:step).permit(:title, :location, :nb_of_days)
  end

end
