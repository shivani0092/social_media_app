class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]

  def show
    @user = User.find(params[:id])
  end

  def index
    @posts = Post.all.order("created_at ASC")
  end 

end
