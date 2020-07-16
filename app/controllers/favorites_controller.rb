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
    respond_to do |format|
      format.html
      format.js
    end
    # redirect_to step_path(@favorite.step)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @step = @favorite.step
    @favorite.destroy
      respond_to do |format|
      format.html
      format.js
    end
  end
end
