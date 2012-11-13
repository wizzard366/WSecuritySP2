class CreateResidentialBannedLists < ActiveRecord::Migration
  def change
    create_table :residential_banned_lists do |t|
      t.integer :visitor_id
      t.integer :residential_id

      t.timestamps
    end
  end
end
