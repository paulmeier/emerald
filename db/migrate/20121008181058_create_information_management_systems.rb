class CreateInformationManagementSystems < ActiveRecord::Migration
  def change
    create_table :information_management_systems do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
