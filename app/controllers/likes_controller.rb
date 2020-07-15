class LikesController < ApplicationController
  before_action :find_post
  
  def create
    like = @post.likes.create(user_id: current_user.id)
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  private

  def find_post
    @post = Post.find_by_id(params[:post_id])
  end

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end