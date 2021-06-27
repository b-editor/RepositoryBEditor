class CreateVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :versions do |t|
      t.string :download_url
      t.string :update_note
      t.string :update_note_short
      t.string :release_datetime
      t.timestamps
    end
  end
end
