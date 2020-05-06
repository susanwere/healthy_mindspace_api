class User < ApplicationRecord
  has_secure_password
  validates :username, :email, presence: true 
  validates :username, :email, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }, :if => :password
  validates :username, length: { minimum: 3 }
  validates :email, email: true

  mount_uploader :user_image, UserImageUploader
end
