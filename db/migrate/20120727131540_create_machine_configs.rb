class CreateMachineConfigs < ActiveRecord::Migration
  def change
    create_table :machine_configs do |t|
      t.integer :id
      t.integer :machine_id
      t.string :name
      t.string :mod_id
      t.integer :capacity_id
      t.integer :machineLoc_id
      t.integer :centralStorage
      t.integer :ziip
      t.integer :icf
      t.integer :cbu
      t.integer :ifb
      t.integer :es
      t.integer :fi
      t.integer :osa
      t.integer :crypto

      t.timestamps
    end
  end
end
