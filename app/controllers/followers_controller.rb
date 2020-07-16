class FollowersController < ApplicationController
  def index
    @followers = Follower.where(user: current_user)
  end

  def create
    @user = User.find(params[:user_id])
    @follower = Follower.new
    @follower.user = @user
    @follower.follower_pseudo = current_user.pseudo
    @follower.save
    redirect_to user_path(@follower.user)
  end

  def destroy
    @follower = Follower.find(params[:id])
    @user = @follower.user
    @follower.destroy
    redirect_to user_path(@user)
  end
end
