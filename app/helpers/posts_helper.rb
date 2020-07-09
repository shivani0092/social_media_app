module PostsHelper
  def avatar_url(post)
    post&.avatar&.thumb&.url
  end

  def add_post_comment(post)
    post.comments.build
  end
end
