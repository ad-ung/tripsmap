class FollowersController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @follower = Follower.new
    @follower.user = @user
    @follower.follower_pseudo = current_user.pseudo
    @follower.save
    @followers = @user.followers || 0

    # redirect_to user_path(@follower.user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @follower = Follower.find(params[:id])
    @user = @follower.user
    @follower.destroy
    @followers = @user.followers || 0

    # redirect_to user_path(@user)
    respond_to do |format|
      format.js
    end
  end
end
