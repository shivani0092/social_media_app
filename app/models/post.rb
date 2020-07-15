# Post
class Post < ApplicationRecord
  include Uploadable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  def liked?(user)
  	likes.where(user_id: user.id).any?
  end
end
