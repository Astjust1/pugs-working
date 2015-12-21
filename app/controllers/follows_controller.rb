class FollowsController < ApplicationController
     before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @activity = PublicActivity::Activity.find_by(trackable_id: (params[:user_id]), trackable_type: controller_path.classify)
    @activity.destroy
    current_user.stop_following(@user)
  end
end
