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
    redirect_to step_path(@favorite.step)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @step = @favorite.step
    @favorite.destroy
    redirect_to step_path(@step)
  end
end
