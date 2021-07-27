class ChangeNameLicenceColumnOnPackage < ActiveRecord::Migration[6.0]
  def change
    rename_column :packages, :licence, :license
  end
end
