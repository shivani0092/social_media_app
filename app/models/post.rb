class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy	
  validate :avatar_size_validation
  mount_uploader :avatar, AvatarUploader
  
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
end
