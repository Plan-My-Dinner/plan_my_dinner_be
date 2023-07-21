class User < ApplicationRecord
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  has_secure_password
end
