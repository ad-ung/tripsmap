class FollowersController < ApplicationController
  def create
  end

  def destroy
    @follower = Follower.find(params[:id])
    @user = @follower.user
    @follower.destroy
    redirect_to user_path(@user)
  end
end
