class CreateCpus < ActiveRecord::Migration
  def change
    create_table :cpus do |t|
      t.integer :id
      t.datetime :datetime
      t.string :smfid
      t.integer :mips

      t.timestamps
    end
  end
end
