class CreateSysplexes < ActiveRecord::Migration
  def change
    create_table :sysplexes do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
