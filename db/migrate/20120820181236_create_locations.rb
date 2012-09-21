class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :id
      t.string :name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
