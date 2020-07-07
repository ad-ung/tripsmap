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
    @trip = Trip.find(params[:trip_id])
    @step = Step.new(step_params)
    @step.trip = @trip
    @step.id_in_its_trip = @trip.steps.count + 1
    @step.save
  end

  def explore
    @blocks = Block.where(mediatype: 'photos')
    @steps = Step.all
    if params[:search]
     @steps = Step.search_by_location_and_title(params[:search])

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
    params.require(:step).permit(:title, :location, :nb_of_days, :id_in_its_trip)
  end
end
