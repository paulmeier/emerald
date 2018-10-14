class CreateCapacities < ActiveRecord::Migration
  def change
    create_table :capacities do |t|
      t.integer :id
      t.string :name
      t.string :number
      t.integer :capSetting
      t.integer :msu
      t.integer :mips

      t.timestamps
    end
  end
end
