module Indexable
  extend ActiveSupport::Concern

  def index
    @posts = Post.all.order("created_at ASC")
  end
end
