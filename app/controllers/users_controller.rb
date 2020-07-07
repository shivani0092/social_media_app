class UsersController < ApplicationController
  def show
 	@posts = Post.all.order('created_at DESC')
  end
end
