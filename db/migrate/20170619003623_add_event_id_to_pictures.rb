class AddEventIdToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :event_id, :integer
  end
end
