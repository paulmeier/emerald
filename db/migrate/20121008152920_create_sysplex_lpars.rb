class CreateSysplexLpars < ActiveRecord::Migration
  def change
    create_table :sysplex_lpars do |t|
      t.integer :id
      t.integer :sysplex_id
      t.integer :lpar_id

      t.timestamps
    end
  end
end
