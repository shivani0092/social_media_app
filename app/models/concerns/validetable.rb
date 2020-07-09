module Validetable
  extend ActiveSupport::Concern
  
  included do
  	has_many :posts, dependent: :destroy
  	has_many :comments, through: :posts
  	devise :database_authenticatable, :registerable,
  	       :recoverable, :rememberable, :validatable
  	validates :name, presence: true
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, case_sensitive: false
  	validates :password, presence: true, length: { minimum: 6 }
  	validates :password_confirmation, presence: true
  end

end 