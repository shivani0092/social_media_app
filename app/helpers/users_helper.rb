module UsersHelper
  def user_posts(user)
    user.posts
  end
  
  def avatar_url(user)
    user&.avatar&.thumb&.url
  end  
end
