class RemoveUserIdColumnOnPackages < ActiveRecord::Migration[6.0]
  def change
    remove_column :packages, :user_id
  end
end
