class AddDefaultValueColumnsOnPackagesAndVersions2 < ActiveRecord::Migration[6.0]
  def change
    change_column :packages, :main_assembly,:string, default: 'error'
    change_column :packages,:uuid, :integer, default: '-1'
  end
end
