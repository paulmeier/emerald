class CreateCustomerInformationControlSystems < ActiveRecord::Migration
  def change
    create_table :customer_information_control_systems do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
