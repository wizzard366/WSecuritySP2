class CreateUserStatuses < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
