class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :url, :null => false
      t.string :key, :null => false
      t.integer :user_id

      t.timestamps
    end
  end
end
