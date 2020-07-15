# Notificationable
module Notificationable
  extend ActiveSupport::Concern

  included do
    after_commit :create_notifications, on: :create, unless: :current_user?
  end

  def current_user?
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
