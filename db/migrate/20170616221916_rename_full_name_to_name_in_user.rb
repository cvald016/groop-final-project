class RenameFullNameToNameInUser < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :full_name, :name
  end
end
