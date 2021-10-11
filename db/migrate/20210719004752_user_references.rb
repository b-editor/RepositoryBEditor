class UserReferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :packages, :user
    add_reference :packages, :user, foreign_key:true, null:false
  end
end
