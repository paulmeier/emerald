class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.integer :id
      t.string :name
      t.string :serialNumber
      t.string :location

      t.timestamps
    end
  end
end
