class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.datetime :take_time

      t.timestamps
    end
  end
end
