# UsersHelper
module UsersHelper
  def avatar_url(user)
    user&.avatar&.thumb&.url
  end

  def check_traget(notification)
    second_target = notification.second_target
    second_target&.description.present? ? second_target.description : second_target&.avatar&.thumb&.url
  end
end
