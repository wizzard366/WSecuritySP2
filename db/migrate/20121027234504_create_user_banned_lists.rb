class CreateUserBannedLists < ActiveRecord::Migration
  def change
    create_table :user_banned_lists do |t|
      t.integer :user_id
      t.integer :visitor_id

      t.timestamps
    end
  end
end
