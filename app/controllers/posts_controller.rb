# PostsController
class PostsController < ApplicationController
  include Indexable
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_user_post, only: [:edit, :update, :destroy, :show]
  def show; end

  def new
    @post = @user.posts.new
  end

  def edit; end

  def create
    @post = @user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to users_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to users_path, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  private

  def set_user
    @user = User.find_by_id(params[:user_id])
  end

  def set_user_post
    @post = @user.posts.find_by(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :description, :avatar, :avatar_cache)
  end
end
