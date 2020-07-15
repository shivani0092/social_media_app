# Like
class Like < ApplicationRecord
  include Notificationable
  belongs_to :post
  belongs_to :user
end
