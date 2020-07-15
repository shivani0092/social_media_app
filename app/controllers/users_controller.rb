# UsersController
class UsersController < ApplicationController
  before_action :authenticate_user!, only: %w(show index)
  include Indexable

  def show
    @user = User.find_by(params[:id])
    @posts = @user.posts.order('created_at DESC')
  end
end
