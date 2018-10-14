class RemoveLocationFromMachines < ActiveRecord::Migration
  def up
    remove_column :machines, :location
  end

  def down
    add_column :machines, :location, :string
  end
end
