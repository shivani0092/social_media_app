# Post
class Post < ApplicationRecord
  include Uploadable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  scope :user_posts, ->(user){ where(user_id: user.id).order('created_at DESC') }
  scope :user_name, -> { user.name }

  def liked?(user)
  	likes.where(user_id: user.id).any?
  end
end
