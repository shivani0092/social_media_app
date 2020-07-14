# Comment
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_commit :create_notifications, on: :create

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
