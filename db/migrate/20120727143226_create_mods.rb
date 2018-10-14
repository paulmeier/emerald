class CreateMods < ActiveRecord::Migration
  def change
    create_table :mods do |t|
      t.integer :id
      t.string :name
      t.integer :books

      t.timestamps
    end
  end
end
