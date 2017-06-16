class AddColumnsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :date, :string
    add_column :events, :location, :string
    add_column :events, :description, :text
  end
end
