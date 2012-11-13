class CreateResidentials < ActiveRecord::Migration
  def change
    create_table :residentials do |t|
      t.string :name
      t.string :residential_address
      t.text :description
      t.text :note
      t.integer :residential_status_id
      t.integer :residential_type_id

      t.timestamps
    end
  end
end
