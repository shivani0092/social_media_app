class Comment < ApplicationRecord
  include CommentNotification
  belongs_to :user
  belongs_to :post
end
