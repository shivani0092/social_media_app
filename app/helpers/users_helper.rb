# UsersHelper
module UsersHelper
  def avatar_url(user)
    user&.avatar&.thumb&.url
  end

  def check_traget(notification)
    description = notification.second_target&.description
    description.nil? ? second_target&.avatar&.thumb&.url : description
  end
end
