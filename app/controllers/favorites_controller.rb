class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user: current_user)
  end

  def create
    @step = Step.find(params[:step_id])
    @favorite = Favorite.new
    @favorite.step = @step
    @favorite.user = current_user
    @favorite.save
  end

  def destroy
    @step = Step.find(params[:id])
    @favorite = Favorite.where(user_id: current_user.id, step_id: @step.id)
    Favorite.destroy(@favorite)
  end
end
