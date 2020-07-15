# PostsHelper
module PostsHelper
  def avatar_url(post)
    post&.avatar&.thumb&.url
  end

  def post_user(post)
    post.user_name
  end
end
