class User < ApplicationRecord
  has_secure_password
  has_many :packages
  enum usertype: [:developer, :user]
end
