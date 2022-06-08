class User < ApplicationRecord
  validates :login, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :password_digest, presence: true
  validates :is_admin, inclusion: { in: [true, false] }

  has_secure_password # from gem 'bcrypt'
end
