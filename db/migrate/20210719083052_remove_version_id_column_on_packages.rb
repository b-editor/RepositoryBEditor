class RemoveVersionIdColumnOnPackages < ActiveRecord::Migration[6.0]
  def change
    remove_column :packages, :version_id
  end
end
