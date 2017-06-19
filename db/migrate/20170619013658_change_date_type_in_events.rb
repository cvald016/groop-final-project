class ChangeDateTypeInEvents < ActiveRecord::Migration[5.1]
  def self.up
    change_column :events, :date, :datetime
  end
 
  def self.down
    change_column :events, :date, :string
  end
end
