class ChangeColumnsOnVersion < ActiveRecord::Migration[6.0]
  def change
    change_column_null :versions, :download_url, false
    change_column_null :versions, :update_note, false
    change_column_null :versions, :update_note_short, false
    change_column_null :versions, :release_datetime, false
  end
end
