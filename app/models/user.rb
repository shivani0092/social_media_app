class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthabl  
  include Uploadable
  include Validetable
  has_many :posts, dependent: :destroy
  has_many :comments
end
