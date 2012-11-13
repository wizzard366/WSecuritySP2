class CreateResidentialStatuses < ActiveRecord::Migration
  def change
    create_table :residential_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
