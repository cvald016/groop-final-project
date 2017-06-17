class RemoveColumnsInUser < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :password_digest
  	remove_column :users, :session_id
  	remove_index :users, :email
  end
end
