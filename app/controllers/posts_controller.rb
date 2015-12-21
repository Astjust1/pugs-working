class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
    @comments = @post.comments.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end
  
  
  # GET /posts
  def index
    @posts = Post.all
  end
  
  def create
    @post = current_user.posts.new(post_params)
    @post.location = params[:location]
    if @post.save
      redirect_to root_path
    else
      redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    activity = PublicActivity::Activity.find_by(trackable_id: self.id, trackable_type: self.class.to_s, key: "#{self.class.to_s.downcase}.create")
    activity.destroy if activity.present?
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :content, :attachment, :location, :when)
  end
end
