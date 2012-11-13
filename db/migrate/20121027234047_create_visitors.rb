class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :id_number
      t.integer :visitor_status_id
      t.text :note

      t.timestamps
    end
  end
end
