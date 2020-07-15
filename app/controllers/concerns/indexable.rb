# Indexable
module Indexable
  extend ActiveSupport::Concern

  def index
    @posts = Post.includes(:user, :likes).all.order('created_at DESC')
  end
end
