class CreateMachineLocs < ActiveRecord::Migration
  def change
    create_table :machine_locs do |t|
      t.integer :id
      t.integer :location_id
      t.integer :machine_id
      t.integer :raisedFloorLoc

      t.timestamps
    end
  end
end
