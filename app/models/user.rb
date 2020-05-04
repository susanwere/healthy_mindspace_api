class User < ApplicationRecord
  has_secure_password
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 8 }
  validates :username, length: { minimum: 3 }
  validates :email, email: true
end
