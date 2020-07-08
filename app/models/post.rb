class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy	
  validates :description, presence: true
  mount_uploader :avatar, AvatarUploader
end
