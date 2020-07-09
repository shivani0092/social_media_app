class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_post, only: [:like, :unlike, :distroy]

  def index
    @posts = Post.all
  end
    
  def new
    @post = @user.posts.new
  end

  def edit
  end

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

  def like
    like = @post.like
    @post.update_column(:like, like.push(current_user.id))
    message = "liked your post"
    update_show(@user)
  end

  def unlike
    like = @post.like - [current_user.id]
    @post.update_column(:like, like)
    update_show(@user)
  end

  def update_show(user)
    @posts = params[:user_id] ? @user.posts : Post.all
    respond_to do |format|
      if params[:user_id].present?
        format.html { redirect_to user_path(@user) }
      else
        format.html { redirect_to users_path } 
      end   
      format.js   {}
    end
  end

  def update
    @post = @user.posts.find(params[:id])
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
    update_show(@user)
  end

  private  

    def set_user  
      @user = User.find(params[:user_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end
      
    def post_params
      params.require(:post).permit(:user_id, :description, :avatar, :avatar_cache)
    end
end
