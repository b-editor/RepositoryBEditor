class Package < ApplicationRecord
  belongs_to :user
  has_many :versions, dependent: :destroy
  serialize :tags, Array
end
