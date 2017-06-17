class ChangesNameToFullNameUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :full_name
  end
end
