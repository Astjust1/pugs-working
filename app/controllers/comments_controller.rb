class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable, only: [:create, :destroy]
  before_destroy :find_and_destroy_comments
  respond_to :js

  def create
    @comment = @commentable.comments.new do |comment|
      comment.comment = params[:comment_text]
      comment.user = current_user
    end
    @comment.save
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment_id = params[:id]
    @activity = PublicActivity::Activity.find_by(trackable_id: (params[:id]), trackable_type: controller_path.classify)
    @activity.destroy
    @comment.destroy
    
  end

  private
  def find_commentable
    @commentable_type = params[:commentable_type].classify
    @commentable = @commentable_type.constantize.find(params[:commentable_id])
  end


  def find_and_destroy_comments
    activity = PublicActivity::Activity.find_by(trackable_id: self.id, trackable_type: self.class.name)
    if activity.present?
     activity.destroy
    end
  end
end
