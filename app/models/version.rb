class Version < ApplicationRecord
  belongs_to :package, optional: true
end
