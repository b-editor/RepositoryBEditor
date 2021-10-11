class User < ApplicationRecord
  has_secure_password
  has_many :packages, dependent: :destroy
  enum role: { admin: 1, normal: 2, developer: 3 }
end
