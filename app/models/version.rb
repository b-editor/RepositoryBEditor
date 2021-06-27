class Version < ApplicationRecord
  belongs_to :packages, dependent: :destroy
end
