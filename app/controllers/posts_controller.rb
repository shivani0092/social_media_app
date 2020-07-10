class PostsController < ApplicationController
  include Filterable
  include Indexable

  def show
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
    update_show(@user)
  end

end
