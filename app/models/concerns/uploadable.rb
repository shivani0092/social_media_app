module Uploadable
  extend ActiveSupport::Concern
  
  included do
    mount_uploader :avatar, AvatarUploader
    validate :picture_size
  end

  def picture_size
    errors.add(:avatar, 'should be less than 1MB') if avatar.size > 1.megabytes
  end  
end 
