class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title 
      t.string :contents      
      t.timestamps null: false	
    end
  end
end
