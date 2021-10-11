class AddUserIdToPackages < ActiveRecord::Migration[6.0]
  def change
    add_reference :packages, :users, foreign_key: true
  end
end
