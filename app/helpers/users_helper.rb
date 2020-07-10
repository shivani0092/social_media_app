module UsersHelper
  def user_posts(user)
    user.posts.order("created_at DESC")
  end
  
  def avatar_url(user)
    user&.avatar&.thumb&.url
  end

  def check_traget(notification)
    second_target = notification&.second_target
    description = notification&.second_target&.description
    description.nil? ? second_target&.avatar&.thumb&.url : description
  end

end
