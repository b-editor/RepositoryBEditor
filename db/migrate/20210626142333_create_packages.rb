class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :main_assembly
      t.bigint :user, foreign_key: true, null: false
      t.string :homepage
      t.string :description
      t.string :description_short
      t.string :tags
      t.integer :uuid
      t.string :licence
      t.bigint :version, foreign_key: true, null: false
      t.timestamps
    end
  end
end
