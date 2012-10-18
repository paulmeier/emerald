class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :id
      t.string :name
      t.text :msg

      t.timestamps
    end
  end
end
