class CreateDb2s < ActiveRecord::Migration
  def change
    create_table :db2s do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
