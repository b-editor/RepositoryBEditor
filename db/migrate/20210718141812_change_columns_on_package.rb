class ChangeColumnsOnPackage < ActiveRecord::Migration[6.0]
  def change
    change_column_null :packages, :name, false
    change_column_null :packages, :main_assembly, false
    change_column_null :packages, :description_short, false
    change_column_null :packages, :uuid, false
    add_index :packages, :name, unique: true
    add_index :packages, :uuid, unique: true
  end
end
