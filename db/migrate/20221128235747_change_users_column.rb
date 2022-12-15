class ChangeUsersColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :sub, :uid
    add_index :users, :uid, unique: true
    remove_column :users, :status, :integer
    remove_column :users, :username, :string
    rename_column :users, :profile_picture, :avatar
  end
end
