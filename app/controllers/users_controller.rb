class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def index
    @posts = Post.all
  end 

end
