class CreateLparConfigs < ActiveRecord::Migration
  def change
    create_table :lpar_configs do |t|
      t.integer :id
      t.integer :lpar_id
      t.integer :codedWeight
      t.integer :runningWeight
      t.integer :ziipWeight
      t.integer :zaapWeight
      t.integer :localEngines
      t.integer :ziip
      t.integer :zaap
      t.integer :ifl
      t.integer :storageCbu
      t.integer :storageNormal
      t.integer :reservedStorage

      t.timestamps
    end
  end
end
