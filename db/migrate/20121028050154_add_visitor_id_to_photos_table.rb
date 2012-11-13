class AddVisitorIdToPhotosTable < ActiveRecord::Migration
  def up
    change_table :photos do |t|
      t.integer :visitor_id
    end
  end
end
