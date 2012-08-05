class AddClicksColumnIntoLinks < ActiveRecord::Migration
  def change
    add_column :links, :clicks, :integer, :default => 0
  end
end
