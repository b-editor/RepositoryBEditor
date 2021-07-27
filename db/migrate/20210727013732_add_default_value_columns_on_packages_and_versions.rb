class AddDefaultValueColumnsOnPackagesAndVersions < ActiveRecord::Migration[6.0]
  def change
    change_column :packages, :name,:string, default: 'untitled'
    change_column :packages, :description_short, :string, default: 'error'
  end
end
