class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :index]


  def create
    @comment = @post.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js   { }
    end
  end

  def index

  end  

  private
    def set_post
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:post_id])
    end  

    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :description)
    end
end
