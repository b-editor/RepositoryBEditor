class Package < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :versions
  serialize :tags, Array
end
