class Version < ApplicationRecord
  belongs_to :package, dependent: :destroy, optional: true
end
