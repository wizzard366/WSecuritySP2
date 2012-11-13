class CreateBannedNames < ActiveRecord::Migration
  def change
    create_table :banned_names do |t|
      t.string :name
      t.string :id_doc
      t.integer :user_id

      t.timestamps
    end
  end
end
