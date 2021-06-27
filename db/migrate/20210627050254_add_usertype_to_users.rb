class AddUsertypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :usertype, :integer
  end
end
