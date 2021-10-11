class AddPackageIdColumnOnVersion < ActiveRecord::Migration[6.0]
  def change
    add_reference :versions, :package, foreign_key:true
  end
end
