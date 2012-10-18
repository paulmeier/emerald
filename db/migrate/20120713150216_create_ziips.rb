class CreateZiips < ActiveRecord::Migration
  def change
    create_table :ziips do |t|
      t.integer :id
      t.datetime :DateTime
      t.string :LPAR
      t.float :PCTBOX

      t.timestamps
    end
  end
end
