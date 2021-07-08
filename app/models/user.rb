class User < ApplicationRecord
  has_secure_password
  has_many :packages
  enum usertype: { developer: 0, user: 1 }
end
