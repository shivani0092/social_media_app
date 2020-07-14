# Indexable
module Indexable
  extend ActiveSupport::Concern

  def index
    @posts = Post.includes(:user).all.order('created_at DESC')
  end
end
