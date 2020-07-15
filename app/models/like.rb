class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_commit :create_notifications, on: :create, unless: :is_not_current_user?

  def is_not_current_user?
    post.user.id == user.id
  end  

  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'post'
      notification.actor = user
      notification.user = post.user
      notification.target = self
      notification.second_target = post
    end
  end
end
