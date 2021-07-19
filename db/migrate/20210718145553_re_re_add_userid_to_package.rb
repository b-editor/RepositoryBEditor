class ReReAddUseridToPackage < ActiveRecord::Migration[6.0]
  def change
    add_reference :packages, :user, foreign_key: true
  end
end
