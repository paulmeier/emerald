class CreateLpars < ActiveRecord::Migration
  def change
    create_table :lpars do |t|
      t.integer :id
      t.string :mid
      t.string :smfid
      t.string :name

      t.timestamps
    end
  end
end
