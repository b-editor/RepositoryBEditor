class RemoveUsersFromUsertype < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :usertype, :integer
  end
end
