class UsersController < ApplicationController
  
  def show
    @user = current_user || User.find(params[:id])
  end

  def index
    @posts = Post.all
  end 

end
