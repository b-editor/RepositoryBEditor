class RemoveVersionsColumnOnPackage < ActiveRecord::Migration[6.0]
  def change
    remove_column :packages, :version
    add_reference :packages, :version, foreign_key: true, null: false
  end
end
