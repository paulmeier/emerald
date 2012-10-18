class CreateMachineLpars < ActiveRecord::Migration
  def change
    create_table :machine_lpars do |t|
      t.integer :id
      t.integer :lpar_id
      t.integer :machine_id

      t.timestamps
    end
  end
end
