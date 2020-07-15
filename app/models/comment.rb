# Comment
class Comment < ApplicationRecord
  include Notificationable
  belongs_to :post
  belongs_to :user
  scope :user_comments, -> { includes(:user).where('user_id IS NOT NULL') }
end
