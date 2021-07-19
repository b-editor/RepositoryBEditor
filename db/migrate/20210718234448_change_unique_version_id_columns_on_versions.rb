class ChangeUniqueVersionIdColumnsOnVersions < ActiveRecord::Migration[6.0]
  def change
    remove_column :packages, :version_id
    add_reference :packages, :version, foreign_key:true, unique: true, null: false
  end
end
