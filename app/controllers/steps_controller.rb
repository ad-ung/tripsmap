class StepsController < ApplicationController
  def index
  end

  def show
    @step = Step.find(params[:id])
    @trip = @step.trip
   # @trip = Trip.find(params[:trip_id])
    # @step = Step.find(params[:id])
     #@step_id = @step.id_in_its_trip
    # @step_id = params[:id].to_i
    # @step = @trip.steps.sort_by(&:id_in_its_trip)[@step_id - 1]
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
    @steps = Step.all
    if params[:search]
     @steps = Step.search_by_location_and_title(params[:search])
    end
  end

  private

  def step_params
    params.require(:step).permit(:title, :location, :nb_of_days)
  end
end
