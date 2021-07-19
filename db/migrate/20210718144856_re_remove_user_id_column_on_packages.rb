class ReRemoveUserIdColumnOnPackages < ActiveRecord::Migration[6.0]
  def change
    remove_column :packages, :users_id
  end
end
