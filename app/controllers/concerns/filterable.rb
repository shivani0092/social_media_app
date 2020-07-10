module Filterable
  extend ActiveSupport::Concern
  
  included do
    before_action :authenticate_user!
    before_action :set_user
    before_action :set_post, only: [:like, :unlike]
    before_action :set_user_post, only: [:edit, :update, :destroy, :show]
  end   
  
  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_post
    @post = @user.posts.find(params[:id])
  end
  
  def set_post
    @post = Post.find(params[:id])
  end 

end
