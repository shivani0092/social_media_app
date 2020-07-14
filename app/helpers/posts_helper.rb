module PostsHelper
  
  def avatar_url(post)
    post&.avatar&.thumb&.url
  end

end
